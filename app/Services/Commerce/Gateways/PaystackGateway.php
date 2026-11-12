<?php

namespace App\Services\Commerce\Gateways;

use App\Models\Commerce\Payment;
use App\Services\Commerce\Contracts\PaymentGateway;
use App\Services\Commerce\InvalidWebhookSignature;
use App\Services\Commerce\VerifiedPayment;
use App\Services\Commerce\WebhookEvent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use RuntimeException;

/** Paystack Standard checkout. Inactive until PAYSTACK_SECRET_KEY is configured. */
class PaystackGateway implements PaymentGateway
{
    public function __construct(private array $config)
    {
        if (empty($config['secret'])) {
            throw new RuntimeException('Paystack is not configured (PAYSTACK_SECRET_KEY missing).');
        }
    }

    public function initialize(Payment $payment, string $email, string $callbackUrl): string
    {
        $response = $this->http()->post('/transaction/initialize', [
            'email' => $email,
            'amount' => $payment->amount_minor,
            'currency' => $payment->currency,
            'reference' => $payment->reference,
            'callback_url' => $callbackUrl,
        ])->throw()->json();

        if (empty($response['status']) || empty($response['data']['authorization_url'])) {
            throw new RuntimeException('Paystack did not return a checkout URL.');
        }

        return $response['data']['authorization_url'];
    }

    public function verify(Payment $payment): VerifiedPayment
    {
        $data = $this->http()->get('/transaction/verify/' . rawurlencode($payment->reference))->throw()->json('data') ?? [];
        $status = match ($data['status'] ?? null) { 'success' => 'succeeded', 'failed', 'abandoned', 'reversed' => 'failed', default => 'pending' };

        return new VerifiedPayment($status, (int) ($data['amount'] ?? 0), (string) ($data['currency'] ?? ''), isset($data['id']) ? (string) $data['id'] : null, $data['channel'] ?? null);
    }

    public function parseWebhook(Request $request): WebhookEvent
    {
        $raw = $request->getContent();
        $expected = hash_hmac('sha512', $raw, (string) $this->config['secret']);
        if (!hash_equals($expected, (string) $request->header('X-Paystack-Signature'))) {
            throw new InvalidWebhookSignature();
        }
        $payload = json_decode($raw, true) ?: [];
        $data = $payload['data'] ?? [];

        return new WebhookEvent(($payload['event'] ?? 'event') . ':' . ($data['id'] ?? sha1($raw)), (string) ($payload['event'] ?? ''), $data['reference'] ?? null, $payload);
    }

    private function http()
    {
        return Http::baseUrl($this->config['base_url'])->withToken($this->config['secret'])->acceptJson()->timeout(15);
    }
}
