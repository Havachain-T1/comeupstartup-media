<?php

namespace App\Services\Commerce;

final class VerifiedPayment
{
    public function __construct(
        public readonly string $status, // succeeded | failed | pending
        public readonly int $amountMinor,
        public readonly string $currency,
        public readonly ?string $gatewayReference = null,
        public readonly ?string $channel = null,
    ) {
    }
}
