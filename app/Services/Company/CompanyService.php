<?php

namespace App\Services\Company;

use App\Enums\CompanyRole;
use App\Models\Company\Company;
use App\Models\Company\CompanyDocument;
use App\Models\Company\CompanyInvitation;
use App\Models\Company\CompanyMember;
use App\Models\Company\CompanyVerification;
use Core\Models\User;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class CompanyService
{
    public const INVITATION_TTL_DAYS = 7;

    public function register(User $owner, array $attributes): Company
    {
        return DB::transaction(function () use ($owner, $attributes) {
            $company = new Company($attributes);
            $company->uuid = (string) Str::uuid();
            $company->slug = $this->uniqueSlug($attributes['name']);
            $company->created_by = $owner->id;
            $company->save();

            $company->members()->create([
                'user_id' => $owner->id,
                'role' => CompanyRole::Owner->value,
                'joined_at' => now(),
            ]);

            activity('company')->performedOn($company)->causedBy($owner)->log('company.registered');

            return $company;
        });
    }

    /** @return array{0: CompanyInvitation, 1: string} invitation and the plain token (only ever shown once) */
    public function invite(Company $company, CompanyMember $inviter, string $email, CompanyRole $role): array
    {
        $this->assertCanAssign($inviter, $role);
        $email = Str::lower(trim($email));

        if ($company->users()->where('tl_users.email', $email)->exists()) {
            throw ValidationException::withMessages(['email' => 'This person is already a member of the company.']);
        }

        $company->invitations()->where('email', $email)->whereNull('accepted_at')->whereNull('revoked_at')
            ->update(['revoked_at' => now()]);

        $token = Str::random(48);
        $invitation = $company->invitations()->create([
            'email' => $email,
            'role' => $role->value,
            'token_hash' => hash('sha256', $token),
            'invited_by' => $inviter->user_id,
            'expires_at' => now()->addDays(self::INVITATION_TTL_DAYS),
        ]);

        activity('company')->performedOn($company)->causedBy($inviter->user_id)
            ->withProperties(['email' => $email, 'role' => $role->value])->log('company.member_invited');

        return [$invitation, $token];
    }

    public function accept(CompanyInvitation $invitation, User $user): CompanyMember
    {
        if (!$invitation->isPending()) {
            throw ValidationException::withMessages(['invitation' => 'This invitation is no longer valid.']);
        }
        if (Str::lower($user->email) !== Str::lower($invitation->email)) {
            throw ValidationException::withMessages(['invitation' => 'This invitation was sent to a different email address.']);
        }

        return DB::transaction(function () use ($invitation, $user) {
            $member = CompanyMember::firstOrCreate(
                ['company_id' => $invitation->company_id, 'user_id' => $user->id],
                ['role' => $invitation->role, 'invited_by' => $invitation->invited_by, 'joined_at' => now()]
            );
            $invitation->forceFill(['accepted_at' => now()])->save();

            activity('company')->performedOn($invitation->company)->causedBy($user)->log('company.member_joined');

            return $member;
        });
    }

    public function changeRole(CompanyMember $actor, CompanyMember $member, CompanyRole $role): void
    {
        $this->assertSameCompany($actor, $member);
        $this->assertCanAssign($actor, $role);

        if ($member->roleEnum() === CompanyRole::Owner && $actor->roleEnum() !== CompanyRole::Owner) {
            abort(403, 'Only an owner can change another owner\'s role.');
        }
        if ($member->roleEnum() === CompanyRole::Owner && $role !== CompanyRole::Owner) {
            $this->assertNotLastOwner($member);
        }

        $member->update(['role' => $role->value]);
        activity('company')->performedOn($member->company)->causedBy($actor->user_id)
            ->withProperties(['member' => $member->user_id, 'role' => $role->value])->log('company.member_role_changed');
    }

    public function removeMember(CompanyMember $actor, CompanyMember $member): void
    {
        $this->assertSameCompany($actor, $member);
        $isSelf = $actor->is($member);

        if (!$isSelf && !$actor->can('manage_members')) {
            abort(403);
        }
        if (!$isSelf && $member->roleEnum() === CompanyRole::Owner && $actor->roleEnum() !== CompanyRole::Owner) {
            abort(403, 'Only an owner can remove another owner.');
        }
        if ($member->roleEnum() === CompanyRole::Owner) {
            $this->assertNotLastOwner($member);
        }

        $member->delete();
        activity('company')->performedOn($member->company)->causedBy($actor->user_id)
            ->withProperties(['member' => $member->user_id])->log('company.member_removed');
    }

    /** @param UploadedFile[] $files keyed by document type */
    public function submitVerification(Company $company, CompanyMember $actor, array $files, ?string $notes): CompanyVerification
    {
        if ($company->verification_status === Company::VERIFICATION_PENDING) {
            throw ValidationException::withMessages(['documents' => 'A verification request is already under review.']);
        }

        return DB::transaction(function () use ($company, $actor, $files, $notes) {
            $verification = $company->verifications()->create([
                'status' => 'pending',
                'submitted_by' => $actor->user_id,
                'notes' => $notes,
                'submitted_at' => now(),
            ]);

            foreach ($files as $type => $file) {
                $path = $file->store('company-documents/' . $company->uuid, 'local');
                $company->documents()->create([
                    'company_verification_id' => $verification->id,
                    'type' => $type,
                    'original_name' => Str::limit($file->getClientOriginalName(), 250, ''),
                    'disk' => 'local',
                    'path' => $path,
                    'mime_type' => $file->getMimeType(),
                    'size' => $file->getSize(),
                    'uploaded_by' => $actor->user_id,
                ]);
            }

            $company->forceFill(['verification_status' => Company::VERIFICATION_PENDING])->save();
            activity('company')->performedOn($company)->causedBy($actor->user_id)->log('company.verification_submitted');

            return $verification;
        });
    }

    public function reviewVerification(CompanyVerification $verification, User $reviewer, bool $approved, ?string $reviewerNotes): void
    {
        if ($verification->status !== 'pending') {
            throw ValidationException::withMessages(['status' => 'This verification request has already been reviewed.']);
        }

        DB::transaction(function () use ($verification, $reviewer, $approved, $reviewerNotes) {
            $verification->forceFill([
                'status' => $approved ? 'approved' : 'rejected',
                'reviewed_by' => $reviewer->id,
                'reviewer_notes' => $reviewerNotes,
                'reviewed_at' => now(),
            ])->save();

            $verification->company->forceFill([
                'verification_status' => $approved ? Company::VERIFICATION_VERIFIED : Company::VERIFICATION_REJECTED,
                'verified_at' => $approved ? now() : null,
            ])->save();

            activity('company')->performedOn($verification->company)->causedBy($reviewer)
                ->log($approved ? 'company.verification_approved' : 'company.verification_rejected');
        });
    }

    private function assertCanAssign(CompanyMember $actor, CompanyRole $role): void
    {
        if (!in_array($role, $actor->roleEnum()->assignableRoles(), true)) {
            abort(403, 'You cannot assign this role.');
        }
    }

    private function assertSameCompany(CompanyMember $a, CompanyMember $b): void
    {
        if ((int) $a->company_id !== (int) $b->company_id) {
            abort(404);
        }
    }

    private function assertNotLastOwner(CompanyMember $member): void
    {
        $owners = CompanyMember::where('company_id', $member->company_id)->where('role', CompanyRole::Owner->value)->count();
        if ($owners <= 1) {
            throw ValidationException::withMessages(['role' => 'A company must keep at least one owner.']);
        }
    }

    private function uniqueSlug(string $name): string
    {
        $base = Str::slug($name) ?: 'company';
        $slug = $base;
        $i = 2;
        while (Company::withTrashed()->where('slug', $slug)->exists()) {
            $slug = $base . '-' . $i++;
        }

        return $slug;
    }
}
