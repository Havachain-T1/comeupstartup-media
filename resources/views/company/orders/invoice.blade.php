<!doctype html>
<html lang="{{ app()->getLocale() }}"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>{{ $order->invoice->number }}</title>
<link rel="stylesheet" href="{{ asset('public/css/portal/portal.css') }}"><style>@media print{.no-print{display:none}}body{margin:0}</style></head>
<body><main class="cus-portal"><div class="cus-container" style="max-width:780px"><div class="cus-card"><div class="cus-card__body">
    <div class="cus-page-head"><div><h1>{{ __('Invoice') }} {{ $order->invoice->number }}</h1><p>{{ __('Issued') }} {{ $order->invoice->issued_at->toFormattedDateString() }} · {{ __('Order') }} {{ $order->number }}</p></div><span class="cus-badge cus-badge--success">{{ ucfirst($order->invoice->status) }}</span></div>
    <dl class="cus-dl"><dt>{{ __('From') }}</dt><dd>{{ config('app.name') }}</dd><dt>{{ __('Billed to') }}</dt><dd>{{ $order->invoice->billing_details['name'] ?? $company->name }}@if (!empty($order->invoice->billing_details['registration_number'])) · {{ $order->invoice->billing_details['registration_number'] }}@endif</dd></dl>
    <table class="cus-table" style="margin-top:1rem"><thead><tr><th>{{ __('Description') }}</th><th>{{ __('Amount') }}</th></tr></thead><tbody>
        @foreach ($order->items as $item)<tr><td data-label="{{ __('Description') }}">{{ $item->description }}</td><td data-label="{{ __('Amount') }}">{{ \App\Support\Money::format($item->total_minor, $order->currency) }}</td></tr>@endforeach
        <tr><td><strong>{{ __('Total paid') }}</strong></td><td><strong>{{ $order->invoice->totalLabel() }}</strong></td></tr></tbody></table>
    <p class="no-print" style="margin-top:1rem"><button class="cus-btn cus-btn--secondary" onclick="window.print()">{{ __('Print / save as PDF') }}</button></p>
</div></div></div></main></body></html>
