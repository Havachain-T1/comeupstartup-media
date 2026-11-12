<?php

namespace App\Services\Commerce\Gateways;

use App\Models\Commerce\Payment;
use App\Services\Commerce\Contracts\PaymentGateway;
use App\Services\Commerce\InvalidWebhookSignature;
use App\Services\Commerce\VerifiedPayment;
use App\Services\Commerce\WebhookEvent;
use Illuminate\Http\Request;

/**
 * Local stand-in for a hosted checkout. Signs webhooks with HMAC-SHA512 like Paystack so the
 * callback pipeline is exercised end to end without real money. Refused in production.
 */
class SandboxGateway implements PaymentGateway
{
    public function __construct(private array $config)
    {
    }

    public function initialize(Payment $payment, string $email, string $callbackUrl): string
    {
        $payment->update(['meta' => array_merge($payment->meta ?? [], ['callback_url' => $callbackUrl])]);

        return route('payments.sandbox.show', $payment->reference);
    }

    public function verify(Payment $payment): VerifiedPayment
    {
        $meta = $payment->meta ?? [];
        $outcome = $meta['sandbox_outcome'] ?? null;

        return new VerifiedPayment(
            match ($outcome) { 'success' => 'succeeded', 'failed' => 'failed', default => 'pending' },
            (int) ($meta['sandbox_amount'] ?? $payment->amount_minor),
            $payment->currency,
            'SBX-' . $payment->id,
            'sandbox',
        );
    }

    public function parseWebhook(Request $request): WebhookEvent
    {
        $raw = $request->getContent();
        if (!hash_equals($this->sign($raw), (string) $request->header('X-Sandbox-Signature'))) {
            throw new InvalidWebhookSignature();
        }
        $payload = json_decode($raw, true) ?: [];

        return new WebhookEvent((string) ($payload['id'] ?? ''), (string) ($payload['event'] ?? ''), $payload['data']['reference'] ?? null, $payload);
    }

    public function sign(string $raw): string
    {
        return hash_hmac('sha512', $raw, (string) $this->config['secret']);
    }
}
