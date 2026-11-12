<?php

namespace Tests\Feature\Expert;

use App\Models\Expert\AssessmentRubric;
use App\Models\Expert\ExpertiseCategory;
use App\Models\Expert\ExpertProfile;
use App\Services\Company\CompanyService;
use App\Services\Expert\ExpertMatcher;
use Core\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Str;
use Tests\TestCase;

class ExpertNetworkFoundationTest extends TestCase
{
    use DatabaseTransactions;

    private function expert(string $status, array $levels, int $years = 5, bool $available = true): ExpertProfile
    {
        $user = User::create(['name' => 'E', 'email' => Str::random(8) . '@example.test', 'password' => bcrypt('x'), 'status' => 1, 'user_type' => 2, 'uid' => Str::random(10)]);
        $p = ExpertProfile::create(['user_id' => $user->id, 'headline' => 'Expert ' . Str::random(3), 'years_experience' => $years, 'is_available' => $available]);
        $p->forceFill(['verification_status' => $status])->save();
        foreach ($levels as $id => $level) {
            $p->categories()->attach($id, ['level' => $level]);
        }

        return $p;
    }

    public function test_matching_only_returns_verified_available_experts_ranked_by_fit()
    {
        $fin = ExpertiseCategory::create(['name' => 'Fintech', 'slug' => 'fintech-' . Str::random(4)]);
        $reg = ExpertiseCategory::create(['name' => 'Regulation', 'slug' => 'reg-' . Str::random(4)]);
        $both = $this->expert(ExpertProfile::VERIFIED, [$fin->id => 4, $reg->id => 4]);
        $one = $this->expert(ExpertProfile::VERIFIED, [$fin->id => 5], 20);
        $this->expert(ExpertProfile::PENDING, [$fin->id => 5, $reg->id => 5]);
        $this->expert(ExpertProfile::VERIFIED, [$fin->id => 5, $reg->id => 5], 10, false);

        $matches = app(ExpertMatcher::class)->match([$fin->id, $reg->id]);
        $this->assertSame([$both->id, $one->id], $matches->pluck('id')->all());
        $this->assertGreaterThan($matches[1]->match_score, $matches[0]->match_score);
        $this->assertTrue(app(ExpertMatcher::class)->match([])->isEmpty());
    }

    public function test_verification_status_cannot_be_mass_assigned()
    {
        $p = ExpertProfile::create(['user_id' => 999999, 'headline' => 'x', 'verification_status' => 'verified']);
        $this->assertSame(ExpertProfile::UNVERIFIED, $p->fresh()->verification_status);
    }

    public function test_rubric_scoring_and_engagement_records()
    {
        $rubric = AssessmentRubric::create(['key' => 'readiness', 'version' => 1, 'name' => 'Investment readiness', 'criteria' => [
            ['key' => 'team', 'max' => 5, 'weight' => 2], ['key' => 'traction', 'max' => 5, 'weight' => 1],
        ]]);
        $this->assertSame(80.0, $rubric->score(['team' => 5, 'traction' => 2]));

        $owner = User::find(1);
        $company = app(CompanyService::class)->register($owner, ['name' => 'Assessed Co']);
        $expert = $this->expert(ExpertProfile::VERIFIED, []);
        $engagement = $expert->engagements()->create(['uuid' => (string) Str::uuid(), 'company_id' => $company->id, 'title' => 'Readiness review']);
        $assessment = $engagement->assessments()->create(['assessment_rubric_id' => $rubric->id, 'scores' => ['team' => 5, 'traction' => 2], 'overall_score' => 80]);
        $assessment->findings()->create(['severity' => 'high', 'title' => 'No financial model', 'recommendation' => 'Build a 24-month model']);
        $record = \App\Models\Expert\CompanyKnowledgeRecord::create(['company_id' => $company->id, 'title' => 'Readiness findings', 'source_type' => $assessment::class, 'source_id' => $assessment->id]);
        $this->assertTrue($record->source->is($assessment));
        $this->assertSame('No financial model', $engagement->assessments()->first()->findings->first()->title);
    }
}
