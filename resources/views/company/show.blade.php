@extends('portal.layout')
@section('title', $company->name)
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head">
        <div><h1>{{ $company->name }}</h1><p>{{ __('Your role:') }} <strong>{{ $member->roleEnum()->label() }}</strong> · @include('company._verification_badge')</p></div>
        @if (Route::has('brand-press.create') && $member->can('create_content'))
            <a class="cus-btn cus-btn--primary" href="{{ route('brand-press.create', $company) }}">{{ __('New announcement') }}</a>
        @endif
    </div>
    @if (!$company->isVerified() && $member->can('manage_verification') && $company->verification_status !== 'pending')
        <div class="cus-alert cus-alert--info">{{ __('Verify your company to build trust with readers and editors.') }} <a href="{{ route('company.verification.create', $company) }}">{{ __('Start verification') }}</a></div>
    @endif
    <div class="cus-grid">
        <div class="cus-card cus-stat"><div class="cus-stat__label">{{ __('Team members') }}</div><div class="cus-stat__value">{{ $stats['members'] }}</div></div>
        @foreach ($stats['extra'] ?? [] as $label => $value)
            <div class="cus-card cus-stat"><div class="cus-stat__label">{{ $label }}</div><div class="cus-stat__value">{{ $value }}</div></div>
        @endforeach
    </div>
    <div class="cus-card">
        <div class="cus-card__head"><h2>{{ __('Company details') }}</h2></div>
        <div class="cus-card__body">
            <dl class="cus-dl">
                <dt>{{ __('Legal name') }}</dt><dd>{{ $company->legal_name ?: '—' }}</dd>
                <dt>{{ __('Registration number') }}</dt><dd>{{ $company->registration_number ?: '—' }}</dd>
                <dt>{{ __('Industry') }}</dt><dd>{{ $company->industry ?: '—' }}</dd>
                <dt>{{ __('Website') }}</dt><dd>{{ $company->website ?: '—' }}</dd>
                <dt>{{ __('Contact email') }}</dt><dd>{{ $company->email ?: '—' }}</dd>
            </dl>
        </div>
    </div>
@endsection
