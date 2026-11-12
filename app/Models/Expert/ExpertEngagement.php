<?php

namespace App\Models\Expert;

use Illuminate\Database\Eloquent\Model;

class ExpertEngagement extends Model
{
    protected $guarded = ['id'];

    public const STATUSES = ['proposed', 'accepted', 'in_progress', 'completed', 'cancelled'];

    public function getRouteKeyName()
    {
        return 'uuid';
    }

    public function company()
    {
        return $this->belongsTo(\App\Models\Company\Company::class);
    }

    public function expert()
    {
        return $this->belongsTo(ExpertProfile::class, 'expert_profile_id');
    }

    public function sessions()
    {
        return $this->hasMany(ExpertSession::class);
    }

    public function assessments()
    {
        return $this->hasMany(Assessment::class);
    }
}
