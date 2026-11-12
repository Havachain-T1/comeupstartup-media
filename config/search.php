<?php

return [
    // `database` uses MariaDB/MySQL FULLTEXT indexes with a LIKE fallback.
    // Bind a different App\Services\Search\Contracts\SearchEngine (e.g. Meilisearch/Typesense) to swap engines.
    'driver' => env('SEARCH_DRIVER', 'database'),

    'min_query_length' => 2,
    'max_query_length' => 100,

    'suggest_limits' => [
        'articles' => 6,
        'categories' => 3,
        'authors' => 3,
    ],

    // Seconds to cache suggestion payloads for repeated (popular) queries. 0 disables caching.
    'cache_ttl' => (int) env('SEARCH_CACHE_TTL', 60),

    // Suggest requests per minute per client IP.
    'rate_limit_per_minute' => (int) env('SEARCH_RATE_LIMIT', 120),
];
