<?php

namespace Tests\Feature\Smoke;

use Core\Models\CustomAd;
use Core\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;
use ThemeLooks\SecureLooks\Trait\StringHelper;
use ThemeLooks\SecureLooks\Trait\ThemeLooks;

/**
 * Regression: the sidebar Advertisement Widget form pre-selected the saved ad using its
 * title as the <option> value, so re-saving without re-picking stored the title instead
 * of the ID and the frontend lookup (CustomAd::find) no longer found the ad.
 */
class SidebarAdvertisementWidgetTest extends TestCase
{
    use DatabaseTransactions;

    private int $widgetId;
    private int $sidebarHasWidgetId;

    protected function setUp(): void
    {
        parent::setUp();

        // The vendor (ThemeLooks) licence gate on widget routes needs a real purchase key; it is not under test here.
        $this->withoutMiddleware([StringHelper::class, ThemeLooks::class]);

        $this->actingAs(User::findOrFail(1));
        $this->widgetId = DB::table('tl_widgets')->where('widget_name', 'Advertisement Widget')->value('id');
        $sidebarId = DB::table('tl_sidebar_has_widgets')->value('sidebar_id');
        $this->sidebarHasWidgetId = DB::table('tl_sidebar_has_widgets')->insertGetId([
            'sidebar_id' => $sidebarId, 'widget_id' => $this->widgetId, 'order' => 0,
        ]);
    }

    private function makeAd(string $title, string $url): CustomAd
    {
        $ad = new CustomAd();
        $ad->forceFill([
            'type' => 'image', 'title' => $title, 'size' => '300x250', 'url' => $url,
            'start_date' => now()->subDay(), 'end_date' => now()->addDays(7), 'status' => 1,
        ])->save();

        return $ad;
    }

    private function saveWidget(string $adId): void
    {
        $this->post(route('theme.newslooks.widget.widgetSidebarForm'), [
            'sidebar_has_widget_id' => $this->sidebarHasWidgetId,
            'data' => [['name' => 'ad_id', 'value' => $adId], ['name' => 'lang', 'value' => 'en']],
        ])->assertOk()->assertDontSee('Saving Failed');
    }

    private function selectedOptionValueInForm(): string
    {
        $response = $this->post(route('theme.newslooks.widget.get_input_field'), [
            'sidebar_has_widget_id' => $this->sidebarHasWidgetId,
            'widget_id' => $this->widgetId,
            'lang' => 'en',
        ])->assertOk();

        $html = $response->json('html');
        $this->assertNotNull($html, 'Widget form did not render: ' . $response->getContent());
        $this->assertMatchesRegularExpression('/<option value="([^"]*)" selected>/', $html);
        preg_match('/<option value="([^"]*)" selected>/', $html, $matches);

        return html_entity_decode($matches[1]);
    }

    private function storedAdId()
    {
        $value = DB::table('tl_sidebar_widget_has_values')->where('sidebar_has_widget_id', $this->sidebarHasWidgetId)->value('value');

        return json_decode($value, true)['ad_id'] ?? null;
    }

    private function renderedFrontendWidget(): string
    {
        return view('theme/newslooks::frontend.widgets.advertisement_widget', [
            'value' => getSidebarWidgetValues($this->sidebarHasWidgetId, 'en'),
            'active_theme' => getActiveTheme(),
        ])->render();
    }

    public function test_resaving_without_changing_selection_keeps_the_ad_id()
    {
        $ad = $this->makeAd('Regression Sidebar Ad', 'https://first.example.test');
        $this->saveWidget((string) $ad->id);

        $this->assertSame((string) $ad->id, $this->selectedOptionValueInForm());

        $this->saveWidget($this->selectedOptionValueInForm());

        $this->assertSame((string) $ad->id, (string) $this->storedAdId());
        $this->assertStringContainsString('https://first.example.test', $this->renderedFrontendWidget());
    }

    public function test_selecting_a_different_ad_still_works()
    {
        $first = $this->makeAd('First Sidebar Ad', 'https://first.example.test');
        $second = $this->makeAd('Second Sidebar Ad', 'https://second.example.test');
        $this->saveWidget((string) $first->id);

        $this->saveWidget((string) $second->id);

        $this->assertSame((string) $second->id, (string) $this->storedAdId());
        $this->assertSame((string) $second->id, $this->selectedOptionValueInForm());
        $html = $this->renderedFrontendWidget();
        $this->assertStringContainsString('https://second.example.test', $html);
        $this->assertStringNotContainsString('https://first.example.test', $html);
    }
}
