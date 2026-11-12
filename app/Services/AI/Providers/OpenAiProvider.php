<?php

namespace App\Services\AI\Providers;

use App\Services\AI\AiException;
use App\Services\AI\ProviderResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Schema;

class OpenAiProvider implements AiProvider
{
    public function __construct(private array $config)
    {
    }

    private function key(): ?string
    {
        if (!empty($this->config['key'])) {
            return $this->config['key'];
        }

        return Schema::hasTable('open_ai_settings') ? (DB::table('open_ai_settings')->value('api_key') ?: null) : null;
    }

    public function isConfigured(): bool
    {
        return (bool) $this->key();
    }

    public function complete(string $system, string $prompt, string $model, int $maxTokens): ProviderResponse
    {
        $response = Http::withToken($this->key())->acceptJson()->timeout($this->config['timeout'] ?? 45)->retry(2, 500, throw: false)
            ->post(rtrim($this->config['base_url'], '/') . '/chat/completions', [
                'model' => $model,
                'max_tokens' => $maxTokens,
                'temperature' => 0.4,
                'messages' => [['role' => 'system', 'content' => $system], ['role' => 'user', 'content' => $prompt]],
            ]);

        if (!$response->successful()) {
            throw new AiException('Provider returned HTTP ' . $response->status() . ': ' . mb_substr((string) $response->json('error.message', ''), 0, 200));
        }

        return new ProviderResponse((string) $response->json('choices.0.message.content', ''), (int) $response->json('usage.prompt_tokens', 0), (int) $response->json('usage.completion_tokens', 0), (string) $response->json('model', $model));
    }
}
