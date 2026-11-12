<?php

namespace App\Services\AI;

use App\Models\Company\Company;
use App\Services\AI\Providers\AiProvider;
use Core\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Throwable;

/**
 * Single entry point for AI features: provider selection, prompt versioning, usage limits and a
 * content-free usage/cost ledger. Results are drafts only (see AiResult).
 */
class AiService
{
    public function __construct(private PromptRepository $prompts)
    {
    }

    public function providerName(): string
    {
        return (string) config('ai.provider');
    }

    public function provider(): AiProvider
    {
        $name = $this->providerName();
        $config = config("ai.providers.$name");
        if (!$config || ($name === 'fake' && app()->environment('production'))) {
            throw new AiException('AI assistance is not configured.', AiException::UNAVAILABLE);
        }

        return new $config['driver']($config);
    }

    public function available(): bool
    {
        try {
            return $this->provider()->isConfigured();
        } catch (AiException) {
            return false;
        }
    }

    public function generate(string $promptKey, array $variables, User $user, ?Company $company = null, ?EditorialAgent $agent = null): AiResult
    {
        if (!$this->available()) {
            throw new AiException('AI assistance is not configured.', AiException::UNAVAILABLE);
        }
        $this->enforceLimits($user, $company);

        $prompt = $this->prompts->active($promptKey);
        $limits = config('ai.limits');
        $rendered = $this->prompts->render($prompt->template, $variables, $limits['max_input_chars']);
        $providerConfig = config('ai.providers.' . $this->providerName());
        $model = $prompt->model ?: $providerConfig['model'];
        $log = [
            'user_id' => $user->id, 'company_id' => $company?->id, 'agent' => $agent?->value, 'prompt_key' => $promptKey,
            'prompt_version' => $prompt->version, 'provider' => $this->providerName(), 'model' => $model,
            'input_hash' => hash('sha256', $rendered), 'created_at' => now(),
        ];

        $started = microtime(true);
        try {
            $response = $this->provider()->complete($prompt->system, $rendered, $model, (int) ($prompt->max_tokens ?: $limits['max_output_tokens']));
        } catch (Throwable $e) {
            DB::table('ai_requests')->insert($log + ['status' => 'error', 'latency_ms' => $this->ms($started), 'error' => mb_substr(class_basename($e) . ': ' . $e->getMessage(), 0, 500)]);
            Log::warning('AI request failed', ['prompt' => $promptKey, 'provider' => $log['provider'], 'error' => $e->getMessage()]);
            throw new AiException('The AI assistant is unavailable right now. Please try again later.', AiException::FAILED);
        }

        $id = DB::table('ai_requests')->insertGetId($log + [
            'status' => 'ok', 'model' => $response->model, 'latency_ms' => $this->ms($started),
            'input_tokens' => $response->inputTokens, 'output_tokens' => $response->outputTokens,
            'cost_micros' => $this->costMicros($response),
        ]);

        return new AiResult(trim($response->text), $promptKey, (int) $prompt->version, (int) $id);
    }

    public function costMicros(ProviderResponse $response): int
    {
        [$in, $out] = config('ai.pricing.' . $response->model, config('ai.pricing.' . preg_replace('/-\d{4}-\d{2}-\d{2}$/', '', $response->model), [0, 0]));

        return (int) round($response->inputTokens * $in + $response->outputTokens * $out);
    }

    private function enforceLimits(User $user, ?Company $company): void
    {
        $limits = config('ai.limits');
        if (DB::table('ai_requests')->where('user_id', $user->id)->where('status', 'ok')->where('created_at', '>=', now()->startOfDay())->count() >= $limits['user_daily_requests']) {
            throw new AiException('You have reached today\'s AI assistance limit.', AiException::LIMIT);
        }
        if ($company && DB::table('ai_requests')->where('company_id', $company->id)->where('status', 'ok')->where('created_at', '>=', now()->startOfMonth())->count() >= $limits['company_monthly_requests']) {
            throw new AiException('Your company has reached this month\'s AI assistance limit.', AiException::LIMIT);
        }
    }

    private function ms(float $started): int
    {
        return (int) round((microtime(true) - $started) * 1000);
    }
}
