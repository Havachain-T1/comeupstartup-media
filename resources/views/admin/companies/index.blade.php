@extends('core::base.layouts.master')
@section('title') {{ translate('Companies') }} @endsection
@section('custom_css') <link rel="stylesheet" href="{{ asset('public/css/portal/portal.css') }}"> @endsection
@section('main_content')
    <div class="cus-portal" style="padding-top:0">
        <div class="cus-page-head"><div><h1>{{ translate('Companies') }}</h1><p>{{ translate('Registered company accounts and verification requests.') }}</p></div>
            <form method="get" class="cus-actions" role="search">
                <label class="cus-sr-only" for="q">{{ translate('Search') }}</label>
                <input class="cus-input" id="q" name="q" value="{{ request('q') }}" placeholder="{{ translate('Search companies') }}" style="width:auto">
                <select class="cus-input" name="status" style="width:auto" aria-label="{{ translate('Verification status') }}">
                    <option value="">{{ translate('All statuses') }}</option>
                    @foreach (['pending', 'verified', 'rejected', 'unverified'] as $s)<option value="{{ $s }}" @selected(request('status') === $s)>{{ ucfirst($s) }}</option>@endforeach
                </select>
                <button class="cus-btn cus-btn--secondary" type="submit">{{ translate('Filter') }}</button>
            </form></div>
        <div class="cus-card">
            @if ($companies->isEmpty())
                <div class="cus-empty"><h3>{{ translate('No companies found') }}</h3></div>
            @else
                <table class="cus-table">
                    <thead><tr><th>{{ translate('Company') }}</th><th>{{ translate('Members') }}</th><th>{{ translate('Verification') }}</th><th>{{ translate('Registered') }}</th><th></th></tr></thead>
                    <tbody>
                        @foreach ($companies as $company)
                            <tr>
                                <td data-label="{{ translate('Company') }}"><strong>{{ $company->name }}</strong></td>
                                <td data-label="{{ translate('Members') }}">{{ $company->members_count }}</td>
                                <td data-label="{{ translate('Verification') }}">@include('company._verification_badge')</td>
                                <td data-label="{{ translate('Registered') }}">{{ $company->created_at->toFormattedDateString() }}</td>
                                <td data-label=""><a class="cus-btn cus-btn--secondary cus-btn--sm" href="{{ route('admin.companies.show', $company) }}">{{ translate('Review') }}</a></td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            @endif
        </div>
        {{ $companies->links() }}
    </div>
@endsection
