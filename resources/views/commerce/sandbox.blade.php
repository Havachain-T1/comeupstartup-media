@extends('portal.layout')
@section('title', __('Sandbox checkout'))
@section('portal')
    <div class="cus-card" style="max-width:520px;margin:0 auto"><div class="cus-card__body">
        <div class="cus-alert cus-alert--warning">{{ __('Development sandbox — no real money is charged.') }}</div>
        <h1 style="font-size:1.375rem">{{ __('Pay :amount', ['amount' => $payment->order->totalLabel()]) }}</h1>
        <p>{{ __('Order') }} {{ $payment->order->number }} · <code>{{ $payment->reference }}</code></p>
        <form method="post" action="{{ route('payments.sandbox.complete', $payment->reference) }}" class="cus-actions">@csrf
            <button class="cus-btn cus-btn--primary" name="outcome" value="success">{{ __('Simulate successful payment') }}</button>
            <button class="cus-btn cus-btn--danger" name="outcome" value="failed">{{ __('Simulate failure') }}</button></form>
    </div></div>
@endsection
