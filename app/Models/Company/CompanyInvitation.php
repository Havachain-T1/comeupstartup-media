<?php

namespace App\Models\Company;

use App\Enums\CompanyRole;
use Illuminate\Database\Eloquent\Model;

class CompanyInvitation extends Model
{
    protected $fillable = ['company_id', 'email', 'role', 'token_hash', 'invited_by', 'expires_at'];

    protected $hidden = ['token_hash'];

    protected $casts = ['expires_at' => 'datetime', 'accepted_at' => 'datetime', 'revoked_at' => 'datetime'];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function roleEnum(): CompanyRole
    {
        return CompanyRole::from($this->role);
    }

    public function isPending(): bool
    {
        return !$this->accepted_at && !$this->revoked_at && $this->expires_at->isFuture();
    }

    public static function findByToken(string $token): ?self
    {
        return static::where('token_hash', hash('sha256', $token))->first();
    }
}
