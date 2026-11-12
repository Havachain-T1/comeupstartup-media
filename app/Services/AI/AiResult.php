<?php

namespace App\Services\AI;

/** AI output is always a draft: callers must route it through human editorial approval. */
final class AiResult
{
    public const REQUIRES_HUMAN_APPROVAL = true;

    public function __construct(public readonly string $text, public readonly string $promptKey, public readonly int $promptVersion, public readonly int $requestId)
    {
    }
}
