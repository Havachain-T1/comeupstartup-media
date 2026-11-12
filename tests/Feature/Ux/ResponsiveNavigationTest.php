<?php

namespace Tests\Feature\Ux;

use Core\Models\User;
use Tests\TestCase;

class ResponsiveNavigationTest extends TestCase
{
    public function test_public_pages_ship_accessible_navigation_markup_and_assets()
    {
        $html = $this->get('/')->assertOk()->getContent();
        $this->assertStringContainsString('class="cus-skip-link" href="#main-content"', $html);
        $this->assertStringContainsString('<main id="main-content"', $html);
        $this->assertMatchesRegularExpression('/data-target="offcanvasMenu"[^>]*aria-controls="offcanvasMenu" aria-expanded="false"/', $html);
        $this->assertMatchesRegularExpression('/class="close-offcanvas[^"]*" aria-label="[^"]+"/', $html);
        $this->assertStringContainsString('public/js/ux/a11y-nav.js', $html);
        $this->assertStringContainsString('public/css/ux/frontend.css', $html);
        $this->assertStringContainsString('name="viewport"', $html);
    }

    public function test_ux_assets_exist_and_cover_keyboard_and_reduced_motion()
    {
        $js = file_get_contents(public_path('js/ux/a11y-nav.js'));
        foreach (["'Escape'", 'aria-expanded', 'aria-modal', "role', 'button'"] as $needle) {
            $this->assertStringContainsString($needle, $js);
        }
        $css = file_get_contents(public_path('css/ux/frontend.css'));
        $this->assertStringContainsString('prefers-reduced-motion', $css);
        $this->assertStringContainsString(':focus-visible', $css);
        $this->assertStringContainsString('overflow-x: auto', file_get_contents(public_path('css/ux/admin.css')));
    }

    public function test_admin_layout_loads_ux_baseline_and_portal_pages_are_responsive()
    {
        $this->actingAs(User::find(1))->get(route('admin.brand-press.index'))->assertOk()
            ->assertSee('public/css/ux/admin.css', false)->assertSee('public/css/portal/portal.css', false);
        $this->assertStringContainsString('@media', file_get_contents(public_path('css/portal/portal.css')));
    }
}
