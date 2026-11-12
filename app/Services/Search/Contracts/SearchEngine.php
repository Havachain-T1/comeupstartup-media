<?php

namespace App\Services\Search\Contracts;

use App\Services\Search\SearchQuery;
use Illuminate\Database\Eloquent\Builder;

interface SearchEngine
{
    /**
     * Grouped, access-controlled suggestions for the search-as-you-type panel.
     *
     * @return array<int, array{type: string, items: array<int, array<string, mixed>>}>
     */
    public function suggest(SearchQuery $query, array $limits): array;

    /**
     * Constrain and rank an already access-controlled article query for the paginated results page.
     */
    public function constrainArticles(Builder $articles, SearchQuery $query): Builder;
}
