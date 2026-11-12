<?php

namespace Tests\Feature\Advertising;

use Carbon\Carbon;
use Core\Models\CustomAd;
use Core\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class CustomAdSchedulingTest extends TestCase
{
    use DatabaseTransactions;

    private function ad(array $attributes): CustomAd
    {
        $ad = new CustomAd();
        $ad->forceFill(array_merge(['title' => 'Test ad', 'type' => 'image', 'size' => '300x250', 'status' => 1, 'open_ended' => false], $attributes));
        $ad->save();

        return $ad->fresh();
    }

    public function test_dated_ad_inside_its_window_is_live()
    {
        $ad = $this->ad(['start_date' => now()->subDay(), 'end_date' => now()->addDay()]);
        $this->assertTrue($ad->isActive());
        $this->assertSame('live', $ad->displayState());
    }

    public function test_future_and_past_windows_are_scheduled_and_expired()
    {
        $this->assertSame('scheduled', $this->ad(['start_date' => now()->addDay(), 'end_date' => now()->addDays(2)])->displayState());
        $this->assertSame('expired', $this->ad(['start_date' => now()->subDays(2), 'end_date' => now()->subDay()])->displayState());
    }

    public function test_inactive_status_always_hides_the_ad()
    {
        $this->assertFalse($this->ad(['status' => 0, 'start_date' => now()->subDay(), 'end_date' => now()->addDay()])->isActive());
        $this->assertFalse($this->ad(['status' => 0, 'open_ended' => true])->isActive());
    }

    public function test_existing_undated_ads_stay_hidden_so_hidden_campaigns_are_not_activated()
    {
        foreach ([[], ['start_date' => now()->subDay()], ['end_date' => now()->addDay()]] as $dates) {
            $ad = $this->ad($dates);
            $this->assertFalse($ad->isActive());
            $this->assertSame('missing_dates', $ad->displayState());
        }
    }

    public function test_open_ended_ads_display_without_dates()
    {
        $this->assertTrue($this->ad(['open_ended' => true])->isActive());
        $this->assertTrue($this->ad(['open_ended' => true, 'start_date' => now()->subDay()])->isActive());
        $this->assertTrue($this->ad(['open_ended' => true, 'end_date' => now()->addDay()])->isActive());
        $this->assertSame('scheduled', $this->ad(['open_ended' => true, 'start_date' => now()->addDay()])->displayState());
        $this->assertSame('expired', $this->ad(['open_ended' => true, 'end_date' => now()->subMinute()])->displayState());
    }

    public function test_display_state_is_evaluated_at_the_given_time()
    {
        $ad = $this->ad(['start_date' => '2030-01-01 00:00:00', 'end_date' => '2030-02-01 00:00:00']);
        $this->assertSame('live', $ad->displayState(Carbon::parse('2030-01-15')));
        $this->assertSame('expired', $ad->displayState(Carbon::parse('2030-02-01')));
    }

    public function test_admin_can_create_an_open_ended_ad_and_sees_display_state()
    {
        $admin = User::findOrFail(1);

        $this->actingAs($admin)->post(route('core.ads.store'), [
            'title' => 'Open ended sponsor', 'size' => '300x250', 'ad_type' => 'image',
            'ad_url' => 'https://example.com', 'ad_image' => '1', 'open_ended' => '1',
        ])->assertRedirect();

        $ad = CustomAd::where('title', 'Open ended sponsor')->firstOrFail();
        $this->assertTrue($ad->open_ended);
        $this->assertTrue($ad->isActive());

        $this->ad(['title' => 'Legacy undated']);
        $this->actingAs($admin)->get(route('core.ads.list'))->assertOk()
            ->assertSee('Hidden: missing dates')->assertSee('Live');
    }

    public function test_end_date_must_follow_start_date()
    {
        $this->actingAs(User::findOrFail(1))->post(route('core.ads.store'), [
            'title' => 'Bad window', 'size' => '300x250', 'ad_type' => 'image',
            'start_date' => '2030-02-01T00:00', 'end_date' => '2030-01-01T00:00',
        ])->assertSessionHasErrors('end_date');
    }
}
