<?php

namespace App\Services\Expert;

use App\Models\Expert\ExpertProfile;
use Illuminate\Support\Collection;

/**
 * Rule-based first version of expert matching: only verified, available experts; ranked by
 * category coverage weighted by self-declared level, then experience. Designed to be swapped for
 * an embedding/AI-assisted ranker behind the same method signature.
 */
class ExpertMatcher
{
    /** @param int[] $categoryIds */
    public function match(array $categoryIds, int $limit = 10, ?int $maxRateMinor = null): Collection
    {
        $categoryIds = array_values(array_unique(array_map('intval', $categoryIds)));
        if (!$categoryIds) {
            return collect();
        }

        return ExpertProfile::matchable()
            ->when($maxRateMinor, fn ($q) => $q->where(fn ($q) => $q->whereNull('hourly_rate_minor')->orWhere('hourly_rate_minor', '<=', $maxRateMinor)))
            ->whereHas('categories', fn ($q) => $q->whereIn('expertise_categories.id', $categoryIds))
            ->with(['categories' => fn ($q) => $q->whereIn('expertise_categories.id', $categoryIds)])
            ->limit(200)->get()
            ->map(function (ExpertProfile $expert) use ($categoryIds) {
                $coverage = $expert->categories->count() / count($categoryIds);
                $depth = $expert->categories->avg(fn ($c) => $c->pivot->level) / 5;
                $expert->match_score = round(70 * $coverage + 20 * $depth + 10 * min(1, $expert->years_experience / 15), 1);

                return $expert;
            })
            ->sortByDesc('match_score')->take($limit)->values();
    }
}
