<?php

namespace App\Services\AI\Providers;

use App\Services\AI\ProviderResponse;

interface AiProvider
{
    public function isConfigured(): bool;

    public function complete(string $system, string $prompt, string $model, int $maxTokens): ProviderResponse;
}
