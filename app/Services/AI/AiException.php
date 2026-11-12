<?php

namespace App\Services\AI;

use RuntimeException;

class AiException extends RuntimeException
{
    public const UNAVAILABLE = 'unavailable';
    public const LIMIT = 'limit';
    public const FAILED = 'failed';

    public function __construct(string $message, public readonly string $reason = self::FAILED)
    {
        parent::__construct($message);
    }
}
