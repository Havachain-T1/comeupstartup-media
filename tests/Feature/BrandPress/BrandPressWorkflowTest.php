<?php

namespace Tests\Feature\BrandPress;

use App\Enums\CompanyRole;
use App\Models\BrandPress\PressRelease;
use App\Models\Commerce\Order;
use App\Models\Commerce\Product;
use App\Models\Company\Company;
use App\Services\Commerce\PaymentService;
use App\Services\Company\CompanyService;
use Core\Models\User;
use Database\Seeders\BrandPressPackageSeeder;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Tests\TestCase;

class BrandPressWorkflowTest extends TestCase
{
    use DatabaseTransactions;

    private User $owner;
    private Company $company;
    private User $editor;

    protected function setUp(): void
    {
        parent::setUp();
        $this->seed(BrandPressPackageSeeder::class);
        $this->owner = $this->user();
        $this->company = app(CompanyService::class)->register($this->owner, ['name' => 'Press Co ' . Str::random(4)]);
        $this->editor = User::findOrFail(1);
    }

    private function user(): User
    {
        return User::create(['name' => 'U ' . Str::random(4), 'email' => Str::random(8) . '@example.test', 'password' => bcrypt('x'), 'status' => 1, 'user_type' => 2, 'uid' => Str::random(10)]);
    }

    private function body(): string
    {
        return str_repeat('Acme Labs today announced a seed round to expand its fintech platform across West Africa. ', 4) . "\n\n<script>alert(1)</script><a href=\"javascript:alert(1)\" onclick=\"x()\">link</a>";
    }

    private function draft(): PressRelease
    {
        $this->actingAs($this->owner)->post(route('brand-press.store', $this->company), ['title' => 'Acme Labs raises seed round', 'summary' => 'Funding news', 'body' => $this->body()])->assertRedirect();

        return PressRelease::where('company_id', $this->company->id)->latest('id')->firstOrFail();
    }

    private function package(string $code = 'growth')
    {
        return Product::where('code', 'brand-press')->firstOrFail()->packages()->where('code', $code)->firstOrFail();
    }

    private function submitAndPay(): PressRelease
    {
        $release = $this->draft();
        $this->actingAs($this->owner)->post(route('brand-press.submit', [$this->company, $release]), ['package_id' => $this->package()->id])->assertRedirect();
        $release->refresh();
        [$payment] = app(PaymentService::class)->start($release->order, 'a@example.test');
        $payment->update(['meta' => ['sandbox_outcome' => 'success']]);
        app(PaymentService::class)->verify($payment);

        return $release->refresh();
    }

    private function act(PressRelease $release, string $action, array $extra = [])
    {
        return $this->actingAs($this->editor)->post(route('admin.brand-press.action', $release), ['action' => $action] + $extra);
    }

    public function test_packages_are_configuration_not_code()
    {
        $this->assertSame([5000000, 10000000, 17500000], Product::where('code', 'brand-press')->first()->packages->pluck('price_minor')->all());
        $this->package()->update(['price_minor' => 12345600]);
        $release = $this->draft();
        $this->actingAs($this->owner)->post(route('brand-press.submit', [$this->company, $release]), ['package_id' => $this->package()->id]);
        $this->assertSame(12345600, $release->fresh()->order->total_minor);
    }

    public function test_company_member_can_draft_and_submit_creating_an_order()
    {
        $release = $this->draft();
        $this->assertSame(PressRelease::DRAFT, $release->status);
        $this->actingAs($this->owner)->get(route('brand-press.show', [$this->company, $release]))->assertOk()->assertSee('₦100,000');

        $this->actingAs($this->owner)->post(route('brand-press.submit', [$this->company, $release]), ['package_id' => $this->package()->id])
            ->assertRedirect();
        $release->refresh();
        $this->assertSame(PressRelease::AWAITING_PAYMENT, $release->status);
        $this->assertSame(['draft', 'submitted', 'awaiting_payment'], $release->events->pluck('to_status')->all());
        $this->assertSame(Order::STATUS_PENDING, $release->order->status);
        $this->assertTrue($release->order->orderable->is($release));
    }

    public function test_validation_and_role_restrictions()
    {
        $this->actingAs($this->owner)->post(route('brand-press.store', $this->company), ['title' => 'Short', 'body' => 'too short'])->assertSessionHasErrors(['title', 'body']);
        $viewer = $this->user();
        $this->company->members()->create(['user_id' => $viewer->id, 'role' => CompanyRole::Viewer->value]);
        $this->actingAs($viewer)->get(route('brand-press.index', $this->company))->assertOk();
        $this->actingAs($viewer)->post(route('brand-press.store', $this->company), ['title' => 'Viewer title here', 'body' => $this->body()])->assertForbidden();

        $release = $this->draft();
        $outsider = $this->user();
        $other = app(CompanyService::class)->register($outsider, ['name' => 'Other']);
        $this->actingAs($outsider)->get(route('brand-press.show', [$this->company, $release]))->assertNotFound();
        $this->actingAs($outsider)->get(route('brand-press.show', [$other, $release]))->assertNotFound();
        $this->actingAs($this->owner)->post(route('admin.brand-press.action', $release), ['action' => 'approve'])->assertRedirect();
        $this->assertSame(PressRelease::DRAFT, $release->fresh()->status);
    }

    public function test_payment_moves_to_paid_but_never_publishes()
    {
        $release = $this->submitAndPay();
        $this->assertSame(PressRelease::PAID, $release->status);
        $this->assertNull($release->blog_id);
        $this->act($release, 'publish')->assertSessionHasErrors('status');
        $this->assertSame(PressRelease::PAID, $release->fresh()->status);
    }

    public function test_full_editorial_approval_publishes_sanitised_article_with_disclosure()
    {
        $release = $this->submitAndPay();
        $this->actingAs($this->editor)->get(route('admin.brand-press.index'))->assertOk()->assertSee($release->title);
        $this->act($release, 'start_review')->assertRedirect();
        $this->act($release, 'request_changes', ['note' => 'Please add a quote from the CEO.']);
        $this->assertSame(PressRelease::CHANGES_REQUESTED, $release->fresh()->status);

        $this->actingAs($this->owner)->get(route('brand-press.edit', [$this->company, $release]))->assertOk()->assertSee('Please add a quote from the CEO.');
        $this->actingAs($this->owner)->put(route('brand-press.update', [$this->company, $release]), ['title' => 'Acme Labs raises seed round to expand', 'body' => $this->body() . ' "We are thrilled," said the CEO.'])->assertRedirect();
        $this->actingAs($this->owner)->post(route('brand-press.submit', [$this->company, $release]))->assertRedirect();
        $this->assertSame(PressRelease::UNDER_REVIEW, $release->fresh()->status);
        $this->assertSame(1, Order::where('orderable_id', $release->id)->where('orderable_type', PressRelease::class)->count());

        $this->act($release, 'approve');
        $this->act($release, 'publish')->assertRedirect();
        $release->refresh();
        $this->assertSame(PressRelease::PUBLISHED, $release->status);
        $blog = DB::table('tl_blogs')->find($release->blog_id);
        $this->assertSame('Acme Labs raises seed round to expand', $blog->name);
        $this->assertStringNotContainsString('<script', $blog->content);
        $this->assertStringNotContainsString('javascript:', $blog->content);
        $this->assertStringNotContainsString('onclick', $blog->content);
        $this->assertStringContainsString('paid press release', $blog->content);
        $this->get(route('theme.newslooks.blog.details', $blog->permalink))->assertOk()->assertSee('Acme Labs raises seed round to expand');
        $this->actingAs($this->owner)->put(route('brand-press.update', [$this->company, $release]), ['title' => 'Sneaky edit after publish', 'body' => $this->body()])->assertSessionHasErrors('status');
    }

    public function test_scheduled_release_is_published_by_command_when_due()
    {
        $release = $this->submitAndPay();
        $this->act($release, 'start_review');
        $this->act($release, 'approve');
        $this->act($release, 'schedule', ['scheduled_for' => now()->addHour()->toDateTimeString()]);
        $this->assertSame(PressRelease::SCHEDULED, $release->fresh()->status);
        $this->artisan('brand-press:publish-scheduled')->assertExitCode(0);
        $this->assertSame(PressRelease::SCHEDULED, $release->fresh()->status);

        $this->travel(2)->hours();
        $this->artisan('brand-press:publish-scheduled')->expectsOutputToContain('1 announcement')->assertExitCode(0);
        $this->assertSame(PressRelease::PUBLISHED, $release->fresh()->status);
    }

    public function test_rejected_paid_release_can_be_refunded()
    {
        $release = $this->submitAndPay();
        $this->act($release, 'start_review');
        $this->act($release, 'reject')->assertSessionHasErrors('note');
        $this->act($release, 'reject', ['note' => 'Does not meet our editorial standards.']);
        $this->assertSame(PressRelease::REJECTED, $release->fresh()->status);
        $this->act($release, 'refund')->assertRedirect();
        $release->refresh();
        $this->assertSame(PressRelease::REFUNDED, $release->status);
        $this->assertSame(Order::STATUS_REFUNDED, $release->order->status);
        $this->actingAs($this->owner)->get(route('brand-press.show', [$this->company, $release]))->assertOk()->assertSee('Does not meet our editorial standards.');
    }
}
