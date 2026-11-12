<?php

namespace Tests\Feature\Search;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class SearchSuggestTest extends TestCase
{
    use DatabaseTransactions;

    private const TITLE = "Bologna's leaning tower sealed off over fears it could collapse";

    protected function setUp(): void
    {
        parent::setUp();
        config(['search.cache_ttl' => 0]);
    }

    private function articleTitles($response): array
    {
        $groups = collect($response->json('groups'));

        return collect($groups->firstWhere('type', 'articles')['items'] ?? [])->pluck('title')->all();
    }

    public function test_suggest_returns_grouped_json_for_published_articles()
    {
        $response = $this->getJson('/search-suggest?q=bolog')->assertOk()
            ->assertJsonStructure(['query', 'groups', 'total', 'search_url', 'took_ms']);

        $this->assertContains(self::TITLE, $this->articleTitles($response));
        $this->assertStringContainsString('/search/', $response->json('search_url'));
    }

    public function test_multi_word_queries_require_every_word()
    {
        $this->assertContains(self::TITLE, $this->articleTitles($this->getJson('/search-suggest?q=leaning%20tower')));
        $this->assertNotContains(self::TITLE, $this->articleTitles($this->getJson('/search-suggest?q=leaning%20zebra')));
    }

    public function test_short_queries_return_no_results_without_querying_articles()
    {
        DB::enableQueryLog();
        $this->getJson('/search-suggest?q=a')->assertOk()->assertJson(['total' => 0, 'groups' => []]);
        $this->assertCount(0, collect(DB::getQueryLog())->filter(fn ($q) => str_contains($q['query'], 'tl_blogs')));
    }

    public function test_private_articles_are_not_exposed()
    {
        DB::table('tl_blogs')->where('name', self::TITLE)->update(['visibility' => 'private']);

        $this->assertNotContains(self::TITLE, $this->articleTitles($this->getJson('/search-suggest?q=bologna')));
    }

    public function test_unpublished_and_scheduled_articles_are_not_exposed()
    {
        DB::table('tl_blogs')->where('name', self::TITLE)->update(['is_publish' => 2]);
        $this->assertNotContains(self::TITLE, $this->articleTitles($this->getJson('/search-suggest?q=bologna')));

        DB::table('tl_blogs')->where('name', self::TITLE)->update(['is_publish' => 1, 'publish_at' => now()->addDay()]);
        $this->assertNotContains(self::TITLE, $this->articleTitles($this->getJson('/search-suggest?q=bologna')));
    }

    public function test_password_protected_articles_do_not_leak_excerpts()
    {
        DB::table('tl_blogs')->where('name', self::TITLE)->update(['visibility' => 'password']);

        $items = collect($this->getJson('/search-suggest?q=bologna')->json('groups.0.items'));
        $item = $items->firstWhere('title', self::TITLE);
        $this->assertNotNull($item);
        $this->assertNull($item['excerpt']);
    }

    public function test_search_no_longer_matches_the_visibility_column()
    {
        DB::table('tl_blogs')->where('name', self::TITLE)->update(['visibility' => 'password']);

        $this->assertNotContains(self::TITLE, $this->articleTitles($this->getJson('/search-suggest?q=password')));
    }

    public function test_categories_and_authors_are_suggested()
    {
        $category = DB::table('tl_blog_categories')->where('is_publish', 1)->orderBy('id')->first();
        $types = collect($this->getJson('/search-suggest?q=' . urlencode(substr($category->name, 0, 4)))->json('groups'))->pluck('type');
        $this->assertContains('categories', $types);

        $author = DB::table('tl_users')->whereIn('id', DB::table('tl_blogs')->where('is_publish', 1)->select('user_id'))->first();
        $types = collect($this->getJson('/search-suggest?q=' . urlencode(substr($author->name, 0, 4)))->json('groups'))->pluck('type');
        $this->assertContains('authors', $types);
    }

    public function test_unpublished_categories_are_not_suggested()
    {
        $category = DB::table('tl_blog_categories')->where('is_publish', 1)->orderBy('id')->first();
        DB::table('tl_blog_categories')->where('id', $category->id)->update(['is_publish' => 0]);

        $titles = collect($this->getJson('/search-suggest?q=' . urlencode($category->name))->json('groups'))
            ->firstWhere('type', 'categories')['items'] ?? [];
        $this->assertNotContains($category->name, collect($titles)->pluck('title')->all());
    }

    public function test_author_suggestions_do_not_expose_emails()
    {
        $author = DB::table('tl_users')->whereIn('id', DB::table('tl_blogs')->where('is_publish', 1)->select('user_id'))->first();
        $this->getJson('/search-suggest?q=' . urlencode(substr($author->name, 0, 4)))->assertDontSee($author->email);
    }

    public function test_suggest_uses_constant_number_of_queries()
    {
        DB::enableQueryLog();
        $this->getJson('/search-suggest?q=the%20best')->assertOk();
        $count = count(DB::getQueryLog());
        DB::flushQueryLog();
        $this->getJson('/search-suggest?q=world')->assertOk();

        $this->assertLessThanOrEqual(12, $count);
        $this->assertLessThanOrEqual(12, count(DB::getQueryLog()));
    }

    public function test_popular_queries_are_cached()
    {
        config(['search.cache_ttl' => 60]);
        Cache::flush();

        $this->assertFalse($this->getJson('/search-suggest?q=bologna')->json('cached'));
        $this->assertTrue($this->getJson('/search-suggest?q=' . urlencode(' Bologna  '))->json('cached'));
    }

    public function test_suggest_endpoint_is_rate_limited()
    {
        config(['search.rate_limit_per_minute' => 3]);

        foreach (range(1, 3) as $i) {
            $this->getJson('/search-suggest?q=rate' . $i)->assertOk();
        }
        $this->getJson('/search-suggest?q=rate4')->assertStatus(429);
    }

    public function test_operator_characters_are_neutralised()
    {
        $this->getJson('/search-suggest?q=' . urlencode('+bolog* -"tower" (@>~<'))->assertOk();
        $this->getJson('/search-suggest?q=' . urlencode("' OR 1=1 --"))->assertOk();
    }

    public function test_search_results_page_uses_ranked_search_and_paginates()
    {
        $this->get('/search/leaning%20tower')->assertOk()->assertSee(e(self::TITLE), false);
        $this->get('/search/leaning%20zebra')->assertOk()->assertDontSee(e(self::TITLE), false);
        $this->get('/search/the?page=2')->assertOk();
    }

    public function test_search_page_hides_private_articles()
    {
        DB::table('tl_blogs')->where('name', self::TITLE)->update(['visibility' => 'private']);
        $this->get('/search/bologna')->assertOk()->assertDontSee(e(self::TITLE), false);
    }

    public function test_frontend_pages_load_live_search_assets()
    {
        $this->get('/')->assertOk()
            ->assertSee('public/js/search/live-search.js', false)
            ->assertSee('public/css/search/live-search.css', false)
            ->assertSee('window.CUS_SEARCH', false);
    }
}
