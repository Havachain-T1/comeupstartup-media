<?php

namespace Tests\Feature\Smoke;

use Core\Models\CustomAd;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class AdvertisementRenderingTest extends TestCase
{
    use DatabaseTransactions;

    private function makeAd(array $overrides = []): CustomAd
    {
        $ad = new CustomAd();
        $ad->forceFill(array_merge([
            'type' => 'image',
            'title' => 'Smoke Test Ad',
            'content' => null,
            'size' => '300x250',
            'url' => 'https://advertiser.example.test/landing',
            'start_date' => now()->subDay(),
            'end_date' => now()->addDays(7),
            'status' => 1,
        ], $overrides))->save();

        return $ad;
    }

    private function renderWidget(array $value): string
    {
        return view('theme/newslooks::frontend.widgets.advertisement_widget', [
            'value' => $value,
            'active_theme' => getActiveTheme(),
        ])->render();
    }

    public function test_active_image_ad_is_rendered()
    {
        $ad = $this->makeAd();

        $html = $this->renderWidget(['ad_id' => (string) $ad->id]);

        $this->assertStringContainsString('https://advertiser.example.test/landing', $html);
        $this->assertStringContainsString('data-id="' . $ad->id . '"', $html);
    }

    public function test_inactive_ad_is_suppressed()
    {
        $ad = $this->makeAd(['status' => 2]);

        $this->assertStringNotContainsString('advertiser.example.test', $this->renderWidget(['ad_id' => (string) $ad->id]));
    }

    public function test_expired_ad_is_suppressed()
    {
        $ad = $this->makeAd(['start_date' => now()->subDays(10), 'end_date' => now()->subDay()]);

        $this->assertStringNotContainsString('advertiser.example.test', $this->renderWidget(['ad_id' => (string) $ad->id]));
    }

    public function test_not_yet_started_ad_is_suppressed()
    {
        $ad = $this->makeAd(['start_date' => now()->addDay()]);

        $this->assertStringNotContainsString('advertiser.example.test', $this->renderWidget(['ad_id' => (string) $ad->id]));
    }

    public function test_missing_ad_renders_empty_widget_without_error()
    {
        $html = $this->renderWidget(['ad_id' => (string) (CustomAd::max('id') + 1000)]);

        $this->assertStringContainsString('widget_media', $html);
        $this->assertStringNotContainsString('ad-clicker', $html);
    }

    public function test_legacy_image_and_url_widget_configuration_still_renders()
    {
        $html = $this->renderWidget(['ads_image' => '', 'ads_url' => 'https://legacy.example.test', 'google_adsence_sidebar' => '']);

        $this->assertStringContainsString('href="https://legacy.example.test"', $html);
    }

    public function test_active_ad_in_sidebar_is_rendered_on_article_page()
    {
        $ad = $this->makeAd();
        $widgetId = DB::table('tl_widgets')->where('widget_name', 'Advertisement Widget')->value('id');
        foreach (DB::table('tl_sidebar_has_widgets')->distinct()->pluck('sidebar_id') as $sidebarId) {
            $sidebarHasWidgetId = DB::table('tl_sidebar_has_widgets')->insertGetId(['sidebar_id' => $sidebarId, 'widget_id' => $widgetId, 'order' => 0]);
            DB::table('tl_sidebar_widget_has_values')->insert(['sidebar_has_widget_id' => $sidebarHasWidgetId, 'value' => json_encode(['ad_id' => (string) $ad->id])]);
        }
        $post = DB::table('tl_blogs')->where('is_publish', 1)->where('publish_at', '<=', now())->orderBy('id')->first();

        $this->get('/post/' . $post->permalink)
            ->assertOk()
            ->assertSee('https://advertiser.example.test/landing', false);
    }
}
