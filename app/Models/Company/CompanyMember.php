<?php

namespace App\Models\Company;

use App\Enums\CompanyRole;
use Core\Models\User;
use Illuminate\Database\Eloquent\Model;

class CompanyMember extends Model
{
    protected $fillable = ['company_id', 'user_id', 'role', 'invited_by', 'joined_at'];

    protected $casts = ['joined_at' => 'datetime'];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function roleEnum(): CompanyRole
    {
        return CompanyRole::from($this->role);
    }

    public function can(string $ability): bool
    {
        return $this->roleEnum()->can($ability);
    }
}
