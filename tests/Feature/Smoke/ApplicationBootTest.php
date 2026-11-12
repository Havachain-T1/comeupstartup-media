<?php

namespace Tests\Feature\Smoke;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Schema;
use Tests\TestCase;

class ApplicationBootTest extends TestCase
{
    public function test_application_boots_in_testing_environment()
    {
        $this->assertSame('testing', $this->app->environment());
        $this->assertTrue($this->app->isBooted());
    }

    public function test_database_is_reachable_and_is_the_disposable_test_database()
    {
        $this->assertSame(1, (int) DB::selectOne('select 1 as ok')->ok);
        $this->assertSame('comeupstartup_test', DB::connection()->getDatabaseName());
    }

    public function test_required_core_tables_exist()
    {
        $tables = [
            'tl_users', 'tl_blogs', 'tl_blog_categories', 'tl_themes', 'tl_plugins', 'tl_general_settings',
            'tl_widgets', 'tl_sidebar_has_widgets', 'tl_sidebar_widget_has_values', 'custom_ads',
            'roles', 'permissions', 'model_has_roles', 'role_has_permissions',
        ];

        foreach ($tables as $table) {
            $this->assertTrue(Schema::hasTable($table), "Missing table: {$table}");
        }
    }

    public function test_active_theme_and_plugin_routes_are_registered()
    {
        $this->assertNotNull(getActiveTheme());
        $this->assertTrue(Route::has('theme.newslooks.blog.details'));
        $this->assertTrue(Route::has('core.ads.list'));
    }

    public function test_artisan_commands_run()
    {
        $this->artisan('list')->assertExitCode(0);
        $this->artisan('route:list')->assertExitCode(0);
    }
}
