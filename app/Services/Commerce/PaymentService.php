<?php

namespace App\Services\Commerce;

use App\Models\Commerce\Invoice;
use App\Models\Commerce\Order;
use App\Models\Commerce\Payment;
use App\Models\Commerce\PaymentEvent;
use App\Models\Commerce\Refund;
use App\Services\Commerce\Contracts\FulfilsOrders;
use Core\Models\User;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class PaymentService
{
    public function __construct(private GatewayManager $gateways)
    {
    }

    public function start(Order $order, string $email, ?string $gateway = null): array
    {
        if ($order->status !== Order::STATUS_PENDING) {
            throw ValidationException::withMessages(['order' => 'This order is not awaiting payment.']);
        }
        $gateway ??= $this->gateways->defaultName();
        $payment = $order->payments()->create([
            'gateway' => $gateway,
            'reference' => 'PAY-' . strtoupper(Str::random(20)),
            'status' => Payment::STATUS_INITIATED,
            'amount_minor' => $order->total_minor,
            'currency' => $order->currency,
        ]);
        $url = $this->gateways->get($gateway)->initialize($payment, $email, route('payments.return', $payment->reference));

        return [$payment, $url];
    }

    /** Webhook entry point: authenticate, de-duplicate by provider event id, then re-verify server-side. */
    public function handleWebhook(string $gatewayName, Request $request): string
    {
        $event = $this->gateways->get($gatewayName)->parseWebhook($request);
        if ($event->eventId === '') {
            return 'ignored';
        }

        try {
            $record = PaymentEvent::create([
                'gateway' => $gatewayName,
                'event_id' => $event->eventId,
                'type' => $event->type,
                'reference' => $event->reference,
                'payload' => ['event' => $event->type, 'reference' => $event->reference],
            ]);
        } catch (QueryException $e) {
            return 'duplicate';
        }

        $payment = $event->reference ? Payment::where('reference', $event->reference)->where('gateway', $gatewayName)->first() : null;
        $outcome = $payment ? $this->verify($payment) : 'unknown_reference';
        $record->forceFill(['outcome' => $outcome, 'processed_at' => now()])->save();

        return $outcome;
    }

    /** Ask the gateway for the authoritative status and apply it exactly once. */
    public function verify(Payment $payment): string
    {
        $result = $this->gateways->get($payment->gateway)->verify($payment);

        $fulfil = null;
        $outcome = DB::transaction(function () use ($payment, $result, &$fulfil) {
            $payment = Payment::whereKey($payment->id)->lockForUpdate()->first();
            $order = Order::whereKey($payment->order_id)->lockForUpdate()->first();

            if ($payment->status === Payment::STATUS_SUCCEEDED) {
                return 'already_processed';
            }
            if ($result->status === 'pending') {
                return 'pending';
            }
            if ($result->status === 'failed') {
                $payment->update(['status' => Payment::STATUS_FAILED, 'verified_at' => now()]);

                return 'failed';
            }
            if ($result->amountMinor !== (int) $order->total_minor || strtoupper($result->currency) !== strtoupper($order->currency)) {
                $payment->update(['status' => Payment::STATUS_MISMATCH, 'verified_at' => now(), 'meta' => array_merge($payment->meta ?? [], ['verified_amount' => $result->amountMinor, 'verified_currency' => $result->currency])]);
                activity('commerce')->performedOn($order)->withProperties(['reference' => $payment->reference])->log('payment.amount_mismatch');

                return 'amount_mismatch';
            }

            $payment->update(['status' => Payment::STATUS_SUCCEEDED, 'verified_at' => now(), 'gateway_reference' => $result->gatewayReference, 'channel' => $result->channel]);
            if ($order->isPaid()) {
                return 'already_processed';
            }
            $order->update(['status' => Order::STATUS_PAID, 'paid_at' => now()]);
            $this->issueInvoice($order);
            activity('commerce')->performedOn($order)->withProperties(['reference' => $payment->reference, 'gateway' => $payment->gateway])->log('order.paid');
            $fulfil = $order;

            return 'paid';
        });

        if ($fulfil && ($orderable = $fulfil->orderable) instanceof FulfilsOrders) {
            $orderable->orderPaid($fulfil);
        }

        return $outcome;
    }

    public function refund(Order $order, int $amountMinor, ?string $reason, User $actor, ?string $gatewayReference = null): Refund
    {
        $refund = DB::transaction(function () use ($order, $amountMinor, $reason, $actor, $gatewayReference) {
            $order = Order::whereKey($order->id)->lockForUpdate()->first();
            $refundable = $order->total_minor - $order->refunded_minor;
            if (!$order->isPaid() || $amountMinor < 1 || $amountMinor > $refundable) {
                throw ValidationException::withMessages(['amount' => 'Refund amount exceeds the refundable balance.']);
            }
            $payment = $order->payments()->where('status', Payment::STATUS_SUCCEEDED)->first();
            $refund = $order->refunds()->create([
                'payment_id' => $payment?->id,
                'amount_minor' => $amountMinor,
                'currency' => $order->currency,
                'status' => Refund::STATUS_PROCESSED,
                'reason' => $reason,
                'gateway_reference' => $gatewayReference,
                'requested_by' => $actor->id,
                'processed_by' => $actor->id,
                'processed_at' => now(),
            ]);
            $refunded = $order->refunded_minor + $amountMinor;
            $order->update(['refunded_minor' => $refunded, 'status' => $refunded >= $order->total_minor ? Order::STATUS_REFUNDED : Order::STATUS_PARTIALLY_REFUNDED]);
            activity('commerce')->performedOn($order)->causedBy($actor)->withProperties(['amount_minor' => $amountMinor])->log('order.refunded');

            return $refund;
        });

        $order->refresh();
        if ($order->status === Order::STATUS_REFUNDED && ($orderable = $order->orderable) instanceof FulfilsOrders) {
            $orderable->orderRefunded($order);
        }

        return $refund;
    }

    private function issueInvoice(Order $order): Invoice
    {
        $company = $order->company;

        return Invoice::firstOrCreate(['order_id' => $order->id], [
            'company_id' => $order->company_id,
            'number' => config('commerce.invoice_prefix', 'CUS-INV') . '-' . now()->format('Y') . '-' . str_pad((string) $order->id, 6, '0', STR_PAD_LEFT),
            'status' => 'paid',
            'total_minor' => $order->total_minor,
            'currency' => $order->currency,
            'billing_details' => $company ? ['name' => $company->legal_name ?: $company->name, 'registration_number' => $company->registration_number, 'email' => $company->email, 'country' => $company->country] : null,
            'issued_at' => now(),
        ]);
    }
}
