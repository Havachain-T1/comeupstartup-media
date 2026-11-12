<?php

namespace App\Services\Search;

use App\Services\Search\Contracts\SearchEngine;
use Illuminate\Support\Facades\Cache;

class SearchService
{
    public function __construct(private SearchEngine $engine)
    {
    }

    public function query(string $raw): SearchQuery
    {
        return new SearchQuery($raw, (int) config('search.max_query_length', 100));
    }

    /** @return array{query: string, groups: array, total: int, cached: bool} */
    public function suggest(string $raw): array
    {
        $query = $this->query($raw);

        if ($query->length() < (int) config('search.min_query_length', 2)) {
            return ['query' => $query->normalized, 'groups' => [], 'total' => 0, 'cached' => false];
        }

        $limits = config('search.suggest_limits');
        $ttl = (int) config('search.cache_ttl', 0);
        $build = fn () => $this->engine->suggest($query, $limits);

        $cached = false;
        if ($ttl > 0) {
            $key = 'search:suggest:v1:' . getFrontLocale() . ':' . sha1($query->normalized);
            $cached = Cache::has($key);
            $groups = Cache::remember($key, $ttl, $build);
        } else {
            $groups = $build();
        }

        return [
            'query' => $query->normalized,
            'groups' => $groups,
            'total' => array_sum(array_map(fn ($g) => count($g['items']), $groups)),
            'cached' => $cached,
        ];
    }
}
