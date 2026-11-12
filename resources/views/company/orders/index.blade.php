@extends('portal.layout')
@section('title', __('Orders & invoices'))
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head"><div><h1>{{ __('Orders & invoices') }}</h1><p>{{ $company->name }}</p></div></div>
    <div class="cus-card">
        @if ($orders->isEmpty())
            <div class="cus-empty"><h3>{{ __('No orders yet') }}</h3><p>{{ __('Orders appear here when you buy a Brand Press package.') }}</p></div>
        @else
            <table class="cus-table">
                <thead><tr><th>{{ __('Order') }}</th><th>{{ __('Date') }}</th><th>{{ __('Total') }}</th><th>{{ __('Status') }}</th><th>{{ __('Invoice') }}</th></tr></thead>
                <tbody>@foreach ($orders as $order)
                    <tr>
                        <td data-label="{{ __('Order') }}"><a href="{{ route('company.orders.show', [$company, $order]) }}">{{ $order->number }}</a></td>
                        <td data-label="{{ __('Date') }}">{{ $order->created_at->toFormattedDateString() }}</td>
                        <td data-label="{{ __('Total') }}">{{ $order->totalLabel() }}</td>
                        <td data-label="{{ __('Status') }}">@include('company.orders._status', ['status' => $order->status])</td>
                        <td data-label="{{ __('Invoice') }}">@if ($order->invoice)<a href="{{ route('company.orders.invoice', [$company, $order]) }}">{{ $order->invoice->number }}</a>@else — @endif</td>
                    </tr>
                @endforeach</tbody>
            </table>
        @endif
    </div>
    {{ $orders->links() }}
@endsection
