<?php

namespace Tests\Feature\Branding;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class XBrandingTest extends TestCase
{
    use DatabaseTransactions;

    public function test_x_brand_stylesheet_remaps_legacy_twitter_icon_classes()
    {
        $css = file_get_contents(public_path('css/brand/x-brand.css'));

        foreach (['.fa-x-twitter:before', '.fa-twitter:before', '.fa-twitter-square:before', '.icofont-twitter:before'] as $selector) {
            $this->assertStringContainsString($selector, $css);
        }
        $this->assertStringContainsString('mask:url("data:image/svg+xml', $css);
    }

    public function test_twitter_share_option_is_labelled_x_and_keeps_share_network_key()
    {
        $option = DB::table('blog_share_options')->where('network', 'twitter')->first();

        $this->assertSame('X', $option->network_name);
        $this->assertStringContainsString('fa-x-twitter', $option->icon);
    }

    public function test_social_follow_settings_no_longer_label_twitter()
    {
        DB::table('tl_theme_option_settings')->where('field_name', 'social_field')->get()
            ->each(function ($row) {
                $this->assertStringNotContainsString('"social_icon_title":"Twitter"', $row->field_value);
                $this->assertStringNotContainsString('fa-twitter-square', $row->field_value);
            });
    }

    public function test_public_article_loads_x_brand_assets_and_renders_x_share_link()
    {
        $post = DB::table('tl_blogs')->where('is_publish', 1)->where('publish_at', '<=', now())->orderBy('id')->first();

        $this->get('/post/' . $post->permalink)
            ->assertOk()
            ->assertSee('css/brand/x-brand.css', false)
            ->assertSee('title="X"', false)
            ->assertSee('fa-x-twitter', false);
    }

    public function test_admin_layout_loads_x_brand_assets()
    {
        $this->actingAs(\Core\Models\User::findOrFail(1))
            ->get(route('admin.dashboard'))
            ->assertOk()
            ->assertSee('css/brand/x-brand.css', false);
    }
}
