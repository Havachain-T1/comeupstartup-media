<?php

namespace App\Http\Controllers\Company;

use App\Enums\CompanyRole;
use App\Http\Controllers\Controller;
use App\Models\Company\Company;
use App\Models\Company\CompanyInvitation;
use App\Models\Company\CompanyMember;
use App\Notifications\CompanyInvitationNotification;
use App\Services\Company\CompanyService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;
use Illuminate\Validation\Rule;

class CompanyMemberController extends Controller
{
    public function index(Request $request, Company $company)
    {
        $member = $request->attributes->get('companyMember');
        $members = $company->members()->with('user:id,name,email')->orderBy('id')->get();
        $invitations = $member->can('manage_members')
            ? $company->invitations()->whereNull('accepted_at')->whereNull('revoked_at')->where('expires_at', '>', now())->latest()->get()
            : collect();

        return view('company.members', compact('company', 'member', 'members', 'invitations'));
    }

    public function invite(Request $request, Company $company, CompanyService $companies)
    {
        $actor = $request->attributes->get('companyMember');
        $data = $request->validate([
            'email' => 'required|email|max:191',
            'role' => ['required', Rule::in(array_map(fn ($r) => $r->value, CompanyRole::cases()))],
        ]);

        [$invitation, $token] = $companies->invite($company, $actor, $data['email'], CompanyRole::from($data['role']));
        $link = route('company.invitations.show', $token);

        try {
            Notification::route('mail', $invitation->email)->notify(new CompanyInvitationNotification($company, $invitation, $link));
        } catch (\Throwable $e) {
            report($e);
        }

        return back()->with('status', __('Invitation sent to :email.', ['email' => $invitation->email]))->with('invite_link', $link);
    }

    public function update(Request $request, Company $company, CompanyMember $member, CompanyService $companies)
    {
        $data = $request->validate(['role' => ['required', Rule::in(array_map(fn ($r) => $r->value, CompanyRole::cases()))]]);
        $companies->changeRole($request->attributes->get('companyMember'), $this->scoped($company, $member), CompanyRole::from($data['role']));

        return back()->with('status', __('Role updated.'));
    }

    public function destroy(Request $request, Company $company, CompanyMember $member, CompanyService $companies)
    {
        $actor = $request->attributes->get('companyMember');
        $member = $this->scoped($company, $member);
        $companies->removeMember($actor, $member);

        return $actor->is($member)
            ? redirect()->route('company.index')->with('status', __('You left :company.', ['company' => $company->name]))
            : back()->with('status', __('Member removed.'));
    }

    public function revokeInvitation(Request $request, Company $company, CompanyInvitation $invitation)
    {
        abort_unless((int) $invitation->company_id === (int) $company->id, 404);
        $invitation->forceFill(['revoked_at' => now()])->save();

        return back()->with('status', __('Invitation revoked.'));
    }

    private function scoped(Company $company, CompanyMember $member): CompanyMember
    {
        abort_unless((int) $member->company_id === (int) $company->id, 404);

        return $member;
    }
}
