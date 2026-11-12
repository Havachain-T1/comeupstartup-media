<?php

namespace App\Models\Expert;

use Illuminate\Database\Eloquent\Model;

class ExpertiseCategory extends Model
{
    protected $guarded = ['id'];

    public function experts()
    {
        return $this->belongsToMany(ExpertProfile::class, 'expert_profile_category')->withPivot('level');
    }
}
