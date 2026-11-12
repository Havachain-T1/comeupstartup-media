<?php

namespace App\Services\Commerce;

final class WebhookEvent
{
    public function __construct(
        public readonly string $eventId,
        public readonly string $type,
        public readonly ?string $reference,
        public readonly array $payload = [],
    ) {
    }
}
