<?php

namespace App\Models\Expert;

use Illuminate\Database\Eloquent\Model;

class AssessmentRubric extends Model
{
    protected $guarded = ['id'];

    protected $casts = ['criteria' => 'array'];

    /** Weighted 0-100 score from per-criterion scores on each criterion's own scale. */
    public function score(array $scores): float
    {
        $total = $weights = 0;
        foreach ($this->criteria as $c) {
            $w = (float) ($c['weight'] ?? 1);
            $weights += $w;
            $total += $w * min(1, max(0, ((float) ($scores[$c['key']] ?? 0)) / (float) ($c['max'] ?? 5)));
        }

        return $weights ? round($total / $weights * 100, 2) : 0.0;
    }
}
