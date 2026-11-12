@extends('portal.layout')
@section('title', __('Order :n', ['n' => $order->number]))
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head"><div><h1>{{ __('Order :n', ['n' => $order->number]) }}</h1><p>@include('company.orders._status', ['status' => $order->status])</p></div>
        <div class="cus-actions">
            @if ($order->status === 'pending' && $member->can('manage_billing'))
                <form method="post" action="{{ route('company.orders.pay', [$company, $order]) }}">@csrf<button class="cus-btn cus-btn--primary" type="submit">{{ __('Pay :amount', ['amount' => $order->totalLabel()]) }}</button></form>
            @elseif ($order->status === 'pending')
                <span class="cus-hint">{{ __('A finance manager, administrator or owner must complete payment.') }}</span>
            @endif
            @if ($order->invoice && $member->can('view_billing'))<a class="cus-btn cus-btn--secondary" href="{{ route('company.orders.invoice', [$company, $order]) }}">{{ __('View invoice') }}</a>@endif
        </div></div>
    <div class="cus-card"><table class="cus-table">
        <thead><tr><th>{{ __('Item') }}</th><th>{{ __('Qty') }}</th><th>{{ __('Amount') }}</th></tr></thead>
        <tbody>@foreach ($order->items as $item)<tr><td data-label="{{ __('Item') }}">{{ $item->description }}</td><td data-label="{{ __('Qty') }}">{{ $item->quantity }}</td><td data-label="{{ __('Amount') }}">{{ \App\Support\Money::format($item->total_minor, $order->currency) }}</td></tr>@endforeach</tbody>
    </table></div>
    @if ($member->can('view_billing') && $order->payments->isNotEmpty())
        <div class="cus-card"><div class="cus-card__head"><h2>{{ __('Payment attempts') }}</h2></div><table class="cus-table">
            <thead><tr><th>{{ __('Reference') }}</th><th>{{ __('Gateway') }}</th><th>{{ __('Status') }}</th><th>{{ __('Date') }}</th></tr></thead>
            <tbody>@foreach ($order->payments as $p)<tr><td data-label="{{ __('Reference') }}"><code>{{ $p->reference }}</code></td><td data-label="{{ __('Gateway') }}">{{ ucfirst($p->gateway) }}</td><td data-label="{{ __('Status') }}">{{ ucfirst(str_replace('_', ' ', $p->status)) }}</td><td data-label="{{ __('Date') }}">{{ $p->created_at->toDayDateTimeString() }}</td></tr>@endforeach</tbody>
        </table></div>
    @endif
@endsection
