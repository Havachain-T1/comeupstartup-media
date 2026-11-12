<?php

namespace Tests\Feature\Company;

use App\Enums\CompanyRole;
use App\Models\Company\Company;
use App\Models\Company\CompanyInvitation;
use App\Models\Company\CompanyMember;
use App\Services\Company\CompanyService;
use Core\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Tests\TestCase;

class CompanyAccountTest extends TestCase
{
    use DatabaseTransactions;

    private function user(): User
    {
        return User::create(['name' => 'User ' . Str::random(6), 'email' => Str::random(8) . '@example.test', 'password' => bcrypt('secret'), 'status' => 1, 'user_type' => 2, 'uid' => Str::random(10)]);
    }

    private function company(User $owner, string $name = 'Acme Labs'): Company
    {
        return app(CompanyService::class)->register($owner, ['name' => $name]);
    }

    private function addMember(Company $company, User $user, CompanyRole $role): CompanyMember
    {
        return $company->members()->create(['user_id' => $user->id, 'role' => $role->value, 'joined_at' => now()]);
    }

    public function test_user_can_register_a_company_and_becomes_owner()
    {
        $user = $this->user();
        $this->actingAs($user)->post(route('company.store'), ['name' => 'Paystack Clone Ltd', 'country' => 'NG'])->assertRedirect();

        $company = Company::where('name', 'Paystack Clone Ltd')->firstOrFail();
        $this->assertSame('paystack-clone-ltd', $company->slug);
        $this->assertSame(CompanyRole::Owner, $company->roleFor($user));
        $this->actingAs($user)->get(route('company.show', $company))->assertOk()->assertSee('Paystack Clone Ltd');
    }

    public function test_registration_is_validated_and_requires_login()
    {
        $this->post(route('company.store'), ['name' => 'X'])->assertRedirect();
        $this->assertSame(0, Company::where('name', 'X')->count());
        $this->actingAs($this->user())->post(route('company.store'), ['name' => '', 'website' => 'not-a-url'])->assertSessionHasErrors(['name', 'website']);
    }

    public function test_user_can_belong_to_multiple_companies()
    {
        $user = $this->user();
        $a = $this->company($user, 'Alpha');
        $b = $this->company($this->user(), 'Beta');
        $this->addMember($b, $user, CompanyRole::Viewer);

        $this->assertSame(2, Company::forUser($user)->count());
        $this->actingAs($user)->get(route('company.index'))->assertOk()->assertSee('Alpha')->assertSee('Beta');
    }

    public function test_non_members_cannot_see_or_modify_another_company()
    {
        $company = $this->company($this->user(), 'Private Co');
        $outsider = $this->user();
        $this->company($outsider, 'Outsider Co');

        $this->actingAs($outsider)->get(route('company.show', $company))->assertNotFound();
        $this->actingAs($outsider)->get(route('company.members.index', $company))->assertNotFound();
        $this->actingAs($outsider)->put(route('company.update', $company), ['name' => 'Hijacked'])->assertNotFound();
        $this->assertSame('Private Co', $company->fresh()->name);
        $this->actingAs($outsider)->get(route('company.index'))->assertDontSee('Private Co');
    }

    public function test_member_ids_from_another_company_cannot_be_targeted()
    {
        $owner = $this->user();
        $mine = $this->company($owner, 'Mine');
        $other = $this->company($this->user(), 'Other');
        $victim = $this->addMember($other, $this->user(), CompanyRole::Editor);

        $this->actingAs($owner)->put(route('company.members.update', [$mine, $victim]), ['role' => 'viewer'])->assertNotFound();
        $this->actingAs($owner)->delete(route('company.members.destroy', [$mine, $victim]))->assertNotFound();
        $this->assertSame('editor', $victim->fresh()->role);
    }

    public function test_role_permissions_are_enforced_server_side()
    {
        $company = $this->company($this->user());
        foreach ([CompanyRole::Editor, CompanyRole::MarketingManager, CompanyRole::FinanceManager, CompanyRole::Viewer] as $role) {
            $user = $this->user();
            $this->addMember($company, $user, $role);
            $this->actingAs($user)->get(route('company.show', $company))->assertOk();
            $this->actingAs($user)->put(route('company.update', $company), ['name' => 'Changed'])->assertForbidden();
            $this->actingAs($user)->post(route('company.members.invite', $company), ['email' => 'x@example.test', 'role' => 'viewer'])->assertForbidden();
            $this->actingAs($user)->get(route('company.verification.create', $company))->assertForbidden();
        }
        $admin = $this->user();
        $this->addMember($company, $admin, CompanyRole::Administrator);
        $this->actingAs($admin)->put(route('company.update', $company), ['name' => 'Renamed'])->assertRedirect();
        $this->assertSame('Renamed', $company->fresh()->name);
    }

    public function test_role_capability_matrix()
    {
        $this->assertTrue(CompanyRole::FinanceManager->can('manage_billing'));
        $this->assertFalse(CompanyRole::Editor->can('manage_billing'));
        $this->assertTrue(CompanyRole::MarketingManager->can('submit_content'));
        $this->assertFalse(CompanyRole::Viewer->can('submit_content'));
        $this->assertNotContains(CompanyRole::Owner, CompanyRole::Administrator->assignableRoles());
        $this->assertContains(CompanyRole::Owner, CompanyRole::Owner->assignableRoles());
        $this->assertSame([], CompanyRole::Editor->assignableRoles());
    }

    public function test_invitation_flow_and_token_security()
    {
        Notification::fake();
        $owner = $this->user();
        $company = $this->company($owner);
        $invitee = $this->user();

        $this->actingAs($owner)->post(route('company.members.invite', $company), ['email' => strtoupper($invitee->email), 'role' => 'editor'])->assertRedirect();
        $invitation = CompanyInvitation::where('company_id', $company->id)->firstOrFail();
        $this->assertSame(strtolower($invitee->email), $invitation->email);
        $this->assertSame(64, strlen($invitation->token_hash));
        $link = session('invite_link');
        $token = Str::afterLast($link, '/');

        $stranger = $this->user();
        $this->actingAs($stranger)->post(route('company.invitations.accept', $token))->assertSessionHasErrors('invitation');
        $this->assertNull($company->roleFor($stranger));

        $this->actingAs($invitee)->get(route('company.invitations.show', $token))->assertOk();
        $this->actingAs($invitee)->post(route('company.invitations.accept', $token))->assertRedirect(route('company.show', $company));
        $this->assertSame(CompanyRole::Editor, $company->roleFor($invitee));
        $this->actingAs($invitee)->post(route('company.invitations.accept', $token))->assertSessionHasErrors('invitation');
        $this->actingAs($invitee)->get(route('company.invitations.show', 'bogus-token'))->assertNotFound();
    }

    public function test_administrators_cannot_create_owners_and_last_owner_is_protected()
    {
        $owner = $this->user();
        $company = $this->company($owner);
        $admin = $this->user();
        $adminMember = $this->addMember($company, $admin, CompanyRole::Administrator);

        $this->actingAs($admin)->post(route('company.members.invite', $company), ['email' => 'boss@example.test', 'role' => 'owner'])->assertForbidden();
        $ownerMember = $company->membershipFor($owner);
        $this->actingAs($admin)->delete(route('company.members.destroy', [$company, $ownerMember]))->assertForbidden();
        $this->actingAs($owner)->delete(route('company.members.destroy', [$company, $ownerMember]))->assertSessionHasErrors('role');
        $this->actingAs($owner)->put(route('company.members.update', [$company, $adminMember]), ['role' => 'owner'])->assertRedirect();
        $this->assertSame('owner', $adminMember->fresh()->role);
    }

    public function test_verification_documents_are_stored_privately_and_reviewed_by_platform_admin()
    {
        Storage::fake('local');
        $owner = $this->user();
        $company = $this->company($owner);

        $this->actingAs($owner)->post(route('company.verification.store', $company), [
            'documents' => ['registration_certificate' => UploadedFile::fake()->create('cac.pdf', 100, 'application/pdf')],
            'notes' => 'RC 123456',
        ])->assertRedirect();

        $company->refresh();
        $this->assertSame('pending', $company->verification_status);
        $doc = $company->documents()->firstOrFail();
        Storage::disk('local')->assertExists($doc->path);
        $this->assertStringStartsWith('company-documents/', $doc->path);

        $this->actingAs($owner)->post(route('company.verification.store', $company), [
            'documents' => ['other' => UploadedFile::fake()->create('evil.php', 10, 'text/x-php')],
        ])->assertSessionHasErrors();

        $admin = User::findOrFail(1);
        $verification = $company->verifications()->firstOrFail();
        $this->actingAs($owner)->post(route('admin.companies.verification.review', $verification), ['decision' => 'approve'])->assertRedirect();
        $this->assertSame('pending', $company->fresh()->verification_status);

        $this->actingAs($admin)->get(route('admin.companies.index'))->assertOk()->assertSee($company->name);
        $this->actingAs($admin)->post(route('admin.companies.verification.review', $verification), ['decision' => 'approve', 'reviewer_notes' => 'OK'])->assertRedirect();
        $this->assertSame('verified', $company->fresh()->verification_status);
    }
}
