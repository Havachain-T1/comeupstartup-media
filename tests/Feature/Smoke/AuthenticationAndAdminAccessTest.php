<?php

namespace Tests\Feature\Smoke;

use Core\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class AuthenticationAndAdminAccessTest extends TestCase
{
    use DatabaseTransactions;

    private function makeUser(int $userType): User
    {
        $user = new User();
        $user->name = 'Smoke Test User';
        $user->email = 'smoke-' . uniqid() . '@example.test';
        $user->password = bcrypt('password');
        $user->status = 1;
        $user->user_type = $userType;
        $user->save();

        return $user;
    }

    public function test_login_page_renders()
    {
        $this->get(route('core.login'))->assertOk();
    }

    public function test_guest_is_redirected_from_admin_routes()
    {
        foreach (['admin.dashboard', 'core.ads.list', 'core.ads.add', 'theme.newslooks.widgets'] as $name) {
            $response = $this->get(route($name));
            $response->assertRedirect();
            $this->assertStringContainsString('login', $response->headers->get('Location'), $name);
        }
    }

    public function test_non_admin_user_is_redirected_from_admin_routes()
    {
        $this->actingAs($this->makeUser(config('settings.user_type.user')))
            ->get(route('core.ads.list'))
            ->assertRedirect(route('core.login'));
    }

    public function test_admin_pages_are_not_gated_by_vendor_licence_verification()
    {
        $admin = User::findOrFail(1);

        foreach (['admin.dashboard', 'core.plugins.index', 'core.themes.index', 'core.manage.menus', 'theme.newslooks.widgets'] as $name) {
            $this->actingAs($admin)->get(route($name))->assertOk();
        }

        foreach (['core.license.active', 'core.license.verify.page', 'core.license.key.verify', 'core.license.key.store', 'core.plugins.purchase.verify', 'core.theme.purchase.verify'] as $name) {
            $this->assertFalse(\Illuminate\Support\Facades\Route::has($name), $name);
        }

        $this->assertFalse(class_exists('ThemeLooks\\SecureLooks\\SecureLooks'));
    }

    public function test_seeded_administrator_can_open_admin_pages()
    {
        $admin = User::findOrFail(1);

        $this->actingAs($admin)->get(route('admin.dashboard'))->assertOk();
        $this->actingAs($admin)->get(route('core.ads.list'))->assertOk();
    }

    public function test_permission_middleware_blocks_admin_without_permission()
    {
        $this->actingAs($this->makeUser(config('settings.user_type.admin')))
            ->get(route('core.ads.list'))
            ->assertForbidden();
    }
}
