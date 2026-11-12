<?php

namespace App\Services\AI\Providers;

use App\Services\AI\ProviderResponse;

class FakeProvider implements AiProvider
{
    public function __construct(private array $config = [])
    {
    }

    public function isConfigured(): bool
    {
        return !app()->environment('production');
    }

    public function complete(string $system, string $prompt, string $model, int $maxTokens): ProviderResponse
    {
        $text = "[DRAFT — generated locally by the fake AI provider]\n\n" . trim(mb_substr(strip_tags($prompt), 0, 600)) . "\n\n[VERIFY] all facts before publication.";

        return new ProviderResponse($text, (int) ceil(mb_strlen($system . $prompt) / 4), (int) ceil(mb_strlen($text) / 4), $model);
    }
}
