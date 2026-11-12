<?php

namespace App\Models\Expert;

use Core\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ExpertProfile extends Model
{
    use SoftDeletes;

    public const UNVERIFIED = 'unverified';
    public const PENDING = 'pending';
    public const VERIFIED = 'verified';
    public const REJECTED = 'rejected';

    protected $guarded = ['id', 'verification_status'];

    protected $casts = ['is_available' => 'boolean'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function categories()
    {
        return $this->belongsToMany(ExpertiseCategory::class, 'expert_profile_category')->withPivot('level');
    }

    public function verifications()
    {
        return $this->hasMany(ExpertVerification::class);
    }

    public function engagements()
    {
        return $this->hasMany(ExpertEngagement::class);
    }

    public function scopeMatchable($query)
    {
        return $query->where('verification_status', self::VERIFIED)->where('is_available', true);
    }
}
