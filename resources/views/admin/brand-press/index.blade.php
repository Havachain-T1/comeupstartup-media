@extends('core::base.layouts.master')
@section('title') {{ translate('Brand Press') }} @endsection
@section('custom_css') <link rel="stylesheet" href="{{ asset('public/css/portal/portal.css') }}"> @endsection
@section('main_content')
    <div class="cus-portal" style="padding-top:0">
        <div class="cus-page-head"><div><h1>{{ translate('Brand Press editorial queue') }}</h1><p>{{ translate('Paid announcements awaiting review, approval or publication.') }}</p></div>
            <nav class="cus-actions" aria-label="{{ translate('Filter') }}">
                @foreach (['queue' => 'Queue', 'scheduled' => 'Scheduled', 'published' => 'Published', 'rejected' => 'Rejected', 'awaiting_payment' => 'Awaiting payment', 'all' => 'All'] as $key => $label)
                    <a class="cus-btn cus-btn--sm {{ $status === $key ? 'cus-btn--primary' : 'cus-btn--secondary' }}" href="{{ route('admin.brand-press.index', ['status' => $key]) }}" @if ($status === $key) aria-current="page" @endif>{{ translate($label) }}</a>
                @endforeach
            </nav></div>
        <div class="cus-card">
            @if ($releases->isEmpty())
                <div class="cus-empty"><h3>{{ translate('Nothing here') }}</h3><p>{{ translate('No announcements match this filter.') }}</p></div>
            @else
                <table class="cus-table">
                    <thead><tr><th>{{ translate('Announcement') }}</th><th>{{ translate('Company') }}</th><th>{{ translate('Package') }}</th><th>{{ translate('Status') }}</th><th>{{ translate('Submitted') }}</th></tr></thead>
                    <tbody>@foreach ($releases as $release)
                        <tr>
                            <td data-label="{{ translate('Announcement') }}"><a href="{{ route('admin.brand-press.show', $release) }}">{{ $release->title }}</a></td>
                            <td data-label="{{ translate('Company') }}">{{ $release->company->name ?? '—' }}</td>
                            <td data-label="{{ translate('Package') }}">{{ $release->package->name ?? '—' }}</td>
                            <td data-label="{{ translate('Status') }}">@include('brand-press._status')</td>
                            <td data-label="{{ translate('Submitted') }}">{{ optional($release->submitted_at)->diffForHumans() ?? '—' }}</td>
                        </tr>
                    @endforeach</tbody>
                </table>
            @endif
        </div>
        {{ $releases->links() }}
    </div>
@endsection
