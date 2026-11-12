<?php

namespace App\Models\Company;

use App\Enums\CompanyRole;
use Core\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Company extends Model
{
    use SoftDeletes;

    public const STATUS_ACTIVE = 'active';
    public const STATUS_SUSPENDED = 'suspended';

    public const VERIFICATION_UNVERIFIED = 'unverified';
    public const VERIFICATION_PENDING = 'pending';
    public const VERIFICATION_VERIFIED = 'verified';
    public const VERIFICATION_REJECTED = 'rejected';

    protected $fillable = ['name', 'legal_name', 'registration_number', 'industry', 'website', 'email', 'phone', 'country', 'description'];

    protected $casts = ['verified_at' => 'datetime'];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function members()
    {
        return $this->hasMany(CompanyMember::class);
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'company_members', 'company_id', 'user_id')->withPivot('role')->withTimestamps();
    }

    public function invitations()
    {
        return $this->hasMany(CompanyInvitation::class);
    }

    public function verifications()
    {
        return $this->hasMany(CompanyVerification::class)->latest('id');
    }

    public function documents()
    {
        return $this->hasMany(CompanyDocument::class);
    }

    public function membershipFor(?User $user): ?CompanyMember
    {
        return $user ? $this->members()->where('user_id', $user->id)->first() : null;
    }

    public function roleFor(?User $user): ?CompanyRole
    {
        return $this->membershipFor($user)?->roleEnum();
    }

    public function isVerified(): bool
    {
        return $this->verification_status === self::VERIFICATION_VERIFIED;
    }

    public function scopeForUser($query, User $user)
    {
        return $query->whereIn('companies.id', CompanyMember::where('user_id', $user->id)->select('company_id'));
    }
}
