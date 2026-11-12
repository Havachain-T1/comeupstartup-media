<?php

namespace App\Services\AI;

final class ProviderResponse
{
    public function __construct(public readonly string $text, public readonly int $inputTokens, public readonly int $outputTokens, public readonly string $model)
    {
    }
}
