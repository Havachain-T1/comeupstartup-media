<?php

namespace App\Services\Commerce\Contracts;

use App\Models\Commerce\Payment;
use App\Services\Commerce\VerifiedPayment;
use App\Services\Commerce\WebhookEvent;
use Illuminate\Http\Request;

interface PaymentGateway
{
    /** Start a hosted checkout and return the URL the payer must visit. */
    public function initialize(Payment $payment, string $email, string $callbackUrl): string;

    /** Ask the provider (server-to-server) for the authoritative state of a payment. */
    public function verify(Payment $payment): VerifiedPayment;

    /** Authenticate and parse a webhook. Must throw InvalidWebhookSignature when the signature is wrong. */
    public function parseWebhook(Request $request): WebhookEvent;
}
