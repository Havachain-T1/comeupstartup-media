<?php

namespace App\Http\Controllers\Search;

use App\Http\Controllers\Controller;
use App\Services\Search\SearchService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SearchSuggestController extends Controller
{
    public function __invoke(Request $request, SearchService $search): JsonResponse
    {
        $started = microtime(true);
        $text = (string) $request->query('q', '');
        $result = $search->suggest($text);
        $searchUrl = trim($result['query']) !== ''
            ? route('theme.newslooks.blog.blogBySearch', str_replace('/', ' ', trim($text)))
            : null;

        return response()->json($result + [
            'search_url' => $searchUrl,
            'took_ms' => round((microtime(true) - $started) * 1000, 2),
        ])->header('Cache-Control', 'public, max-age=30');
    }
}
