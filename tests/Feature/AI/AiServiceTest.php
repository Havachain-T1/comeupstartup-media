<?php

namespace Tests\Feature\AI;

use App\Enums\CompanyRole;
use App\Services\AI\AiException;
use App\Services\AI\AiService;
use App\Services\AI\EditorialAgent;
use App\Services\Company\CompanyService;
use Core\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Tests\TestCase;

class AiServiceTest extends TestCase
{
    use DatabaseTransactions;

    private function user(): User
    {
        return User::create(['name' => 'U', 'email' => Str::random(8) . '@example.test', 'password' => bcrypt('x'), 'status' => 1, 'user_type' => 2, 'uid' => Str::random(10)]);
    }

    public function test_generation_logs_usage_without_storing_content()
    {
        $result = app(AiService::class)->generate('agent.fact_checker', ['brief' => 'SECRET-CLAIM Acme raised $5m', 'sources' => ''], User::find(1), null, EditorialAgent::FactChecker);
        $this->assertTrue($result::REQUIRES_HUMAN_APPROVAL);
        $this->assertSame(1, $result->promptVersion);
        $row = DB::table('ai_requests')->find($result->requestId);
        $this->assertSame('ok', $row->status);
        $this->assertSame('fact_checker', $row->agent);
        $this->assertGreaterThan(0, $row->input_tokens);
        $this->assertStringNotContainsString('SECRET-CLAIM', json_encode($row));
    }

    public function test_new_prompt_version_is_used_and_recorded()
    {
        app(AiService::class)->generate('agent.seo_editor', ['brief' => 'An article'], User::find(1));
        DB::table('ai_prompts')->insert(['key' => 'agent.seo_editor', 'version' => 2, 'system' => 'v2', 'template' => 'V2 {{brief}}', 'is_active' => true, 'created_at' => now(), 'updated_at' => now()]);
        $result = app(AiService::class)->generate('agent.seo_editor', ['brief' => 'An article'], User::find(1));
        $this->assertSame(2, $result->promptVersion);
        $this->assertStringContainsString('V2 An article', $result->text);
    }

    public function test_openai_provider_cost_tracking_and_error_handling()
    {
        config(['ai.provider' => 'openai', 'ai.providers.openai.key' => 'sk-test']);
        Http::fake(['api.openai.com/*' => Http::sequence()
            ->push(['model' => 'gpt-4o-mini', 'choices' => [['message' => ['content' => 'Draft']]], 'usage' => ['prompt_tokens' => 1000, 'completion_tokens' => 1000]])
            ->push(['error' => ['message' => 'quota']], 429)->push(['error' => ['message' => 'quota']], 429)->push(['error' => ['message' => 'quota']], 429)]);

        $ok = app(AiService::class)->generate('agent.startup_reporter', ['brief' => 'x'], User::find(1));
        $this->assertSame('Draft', $ok->text);
        $this->assertSame(750, (int) DB::table('ai_requests')->where('id', $ok->requestId)->value('cost_micros'));
        Http::assertSent(fn ($r) => $r->hasHeader('Authorization', 'Bearer sk-test') && $r['model'] === 'gpt-4o-mini');

        try {
            app(AiService::class)->generate('agent.startup_reporter', ['brief' => 'x'], User::find(1));
            $this->fail('Expected exception');
        } catch (AiException $e) {
            $this->assertSame(AiException::FAILED, $e->reason);
            $this->assertStringNotContainsString('sk-test', $e->getMessage());
        }
        $this->assertSame('error', DB::table('ai_requests')->latest('id')->value('status'));
    }

    public function test_usage_limits_and_production_refuses_fake_provider()
    {
        config(['ai.limits.user_daily_requests' => 1]);
        $user = $this->user();
        app(AiService::class)->generate('agent.seo_editor', ['brief' => 'x'], $user);
        $this->expectException(AiException::class);
        try {
            app(AiService::class)->generate('agent.seo_editor', ['brief' => 'x'], $user);
        } finally {
            $this->app['env'] = 'production';
            $this->assertFalse(app(AiService::class)->available());
            $this->app['env'] = 'testing';
        }
    }

    public function test_brand_press_assist_requires_content_role_and_marks_draft()
    {
        $owner = $this->user();
        $company = app(CompanyService::class)->register($owner, ['name' => 'AI Co']);
        $viewer = $this->user();
        $company->members()->create(['user_id' => $viewer->id, 'role' => CompanyRole::Viewer->value]);
        $payload = ['notes' => 'We launched a payments API for SMEs in Lagos with 300 merchants onboarded.'];

        $this->actingAs($viewer)->postJson(route('brand-press.ai-assist', $company), $payload)->assertForbidden();
        $this->actingAs($this->user())->postJson(route('brand-press.ai-assist', $company), $payload)->assertNotFound();
        $this->actingAs($owner)->postJson(route('brand-press.ai-assist', $company), $payload)->assertOk()->assertJson(['requires_human_approval' => true]);
        $this->assertSame($company->id, (int) DB::table('ai_requests')->latest('id')->value('company_id'));
        $this->actingAs($owner)->get(route('brand-press.create', $company))->assertOk()->assertSee('Draft with AI writing assistance');
    }

    public function test_admin_agents_require_permission()
    {
        $this->actingAs(User::find(1))->get(route('admin.ai.agents'))->assertOk()->assertSee('Funding Reporter')->assertSee('SEO Editor');
        $this->actingAs(User::find(1))->postJson(route('admin.ai.agents.run', 'funding_reporter'), ['brief' => 'Summarise this round'])->assertOk();
        $this->actingAs(User::find(1))->postJson(route('admin.ai.agents.run', 'nope'), ['brief' => 'Summarise this round'])->assertNotFound();
        $this->actingAs($this->user())->get(route('admin.ai.agents'))->assertRedirect();
        $this->assertCount(9, EditorialAgent::cases());
    }
}
