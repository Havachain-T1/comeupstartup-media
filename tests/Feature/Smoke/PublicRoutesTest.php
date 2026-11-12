<?php

namespace Tests\Feature\Smoke;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class PublicRoutesTest extends TestCase
{
    use DatabaseTransactions;

    private function assertHealthyPage($response, int $status = 200)
    {
        $response->assertStatus($status);
        $response->assertDontSee('Whoops', false);
        $response->assertDontSee('SQLSTATE', false);
        $response->assertDontSee('Fatal error', false);

        return $response;
    }

    public function test_homepage_renders()
    {
        $this->assertHealthyPage($this->get('/'));
    }

    public function test_post_listing_renders()
    {
        $this->assertHealthyPage($this->get('/posts'));
    }

    public function test_published_article_renders()
    {
        $post = DB::table('tl_blogs')->where('is_publish', 1)->where('publish_at', '<=', now())->orderBy('id')->first();
        $this->assertNotNull($post, 'Seed has no published article');

        $this->assertHealthyPage($this->get('/post/' . $post->permalink))->assertSee($post->name, false);
    }

    public function test_category_page_renders()
    {
        $category = DB::table('tl_blog_categories')->where('is_publish', 1)->orderBy('id')->first();
        $this->assertNotNull($category, 'Seed has no published category');

        $this->assertHealthyPage($this->get('/category/' . $category->permalink));
    }

    public function test_search_page_renders()
    {
        $this->assertHealthyPage($this->get('/search/climate'));
    }

    public function test_missing_article_returns_not_found()
    {
        $this->assertHealthyPage($this->get('/post/this-article-does-not-exist-' . uniqid()), 404);
    }

    public function test_unknown_url_returns_not_found()
    {
        $this->assertHealthyPage($this->get('/this-url-does-not-exist-' . uniqid()), 404);
    }
}
