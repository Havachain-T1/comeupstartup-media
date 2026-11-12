<?php

namespace App\Http\Controllers\Commerce;

use App\Http\Controllers\Controller;
use App\Models\Commerce\Payment;
use App\Services\Commerce\PaymentService;
use Illuminate\Http\Request;

class PaymentReturnController extends Controller
{
    /** Payer returns from checkout. The query string is never trusted; we re-verify with the gateway. */
    public function return(Request $request, string $reference, PaymentService $payments)
    {
        $payment = $this->ownedPayment($request, $reference);
        $outcome = $payments->verify($payment);
        $order = $payment->order;
        $target = $order->company ? route('company.orders.show', [$order->company, $order]) : url('/');

        $message = match ($outcome) {
            'paid', 'already_processed' => [__('Payment confirmed. Thank you.'), 'status'],
            'pending' => [__('Payment is still being confirmed. This page will update once the provider confirms it.'), 'status'],
            'amount_mismatch' => [__('The payment amount did not match the order. Our team has been notified.'), 'error'],
            default => [__('Payment was not completed.'), 'error'],
        };

        return redirect($target)->with($message[1], $message[0]);
    }

    public function sandbox(Request $request, string $reference)
    {
        abort_if(app()->environment('production'), 404);
        $payment = $this->ownedPayment($request, $reference);
        abort_unless($payment->gateway === 'sandbox', 404);

        return view('commerce.sandbox', ['payment' => $payment->load('order')]);
    }

    public function sandboxComplete(Request $request, string $reference)
    {
        abort_if(app()->environment('production'), 404);
        $payment = $this->ownedPayment($request, $reference);
        abort_unless($payment->gateway === 'sandbox', 404);
        $request->validate(['outcome' => 'required|in:success,failed']);
        $payment->update(['meta' => array_merge($payment->meta ?? [], ['sandbox_outcome' => $request->input('outcome')])]);

        return redirect()->route('payments.return', $payment->reference);
    }

    private function ownedPayment(Request $request, string $reference): Payment
    {
        $payment = Payment::with('order.company')->where('reference', $reference)->firstOrFail();
        $order = $payment->order;
        $allowed = (int) $order->user_id === (int) $request->user()->id
            || ($order->company && $order->company->membershipFor($request->user())?->can('view_billing'));
        abort_unless($allowed, 404);

        return $payment;
    }
}
