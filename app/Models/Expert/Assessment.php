<?php

namespace App\Models\Expert;

use Illuminate\Database\Eloquent\Model;

class Assessment extends Model
{
    protected $guarded = ['id'];

    protected $casts = ['scores' => 'array', 'submitted_at' => 'datetime'];

    public function rubric()
    {
        return $this->belongsTo(AssessmentRubric::class, 'assessment_rubric_id');
    }

    public function findings()
    {
        return $this->hasMany(AssessmentFinding::class);
    }

    public function engagement()
    {
        return $this->belongsTo(ExpertEngagement::class, 'expert_engagement_id');
    }
}
