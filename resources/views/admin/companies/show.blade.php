@extends('core::base.layouts.master')
@section('title') {{ $company->name }} @endsection
@section('custom_css') <link rel="stylesheet" href="{{ asset('public/css/portal/portal.css') }}"> @endsection
@section('main_content')
    <div class="cus-portal" style="padding-top:0">
        <div class="cus-page-head"><div><div class="cus-breadcrumb"><a href="{{ route('admin.companies.index') }}">{{ translate('Companies') }}</a> / {{ $company->name }}</div>
            <h1>{{ $company->name }}</h1><p>@include('company._verification_badge')</p></div></div>
        @if (session('success'))<div class="cus-alert cus-alert--success" role="status">{{ session('success') }}</div>@endif
        @if ($errors->any())<div class="cus-alert cus-alert--danger" role="alert">{{ $errors->first() }}</div>@endif
        <div class="cus-card"><div class="cus-card__head"><h2>{{ translate('Details') }}</h2></div><div class="cus-card__body"><dl class="cus-dl">
            <dt>{{ translate('Legal name') }}</dt><dd>{{ $company->legal_name ?: '—' }}</dd>
            <dt>{{ translate('Registration number') }}</dt><dd>{{ $company->registration_number ?: '—' }}</dd>
            <dt>{{ translate('Website') }}</dt><dd>{{ $company->website ?: '—' }}</dd>
            <dt>{{ translate('Contact email') }}</dt><dd>{{ $company->email ?: '—' }}</dd>
            <dt>{{ translate('Members') }}</dt><dd>@foreach ($company->members as $m){{ $m->user->name ?? '—' }} ({{ $m->roleEnum()->label() }})@if (!$loop->last), @endif @endforeach</dd>
        </dl></div></div>
        @foreach ($company->verifications as $v)
            <div class="cus-card"><div class="cus-card__head"><h2>{{ translate('Verification request') }} #{{ $v->id }}</h2><span class="cus-badge">{{ ucfirst($v->status) }}</span></div>
                <div class="cus-card__body">
                    @if ($v->notes)<p>{{ $v->notes }}</p>@endif
                    <ul>@foreach ($v->documents as $doc)<li><a href="{{ route('admin.companies.document', $doc) }}">{{ \App\Models\Company\CompanyDocument::TYPES[$doc->type] ?? $doc->type }}: {{ $doc->original_name }}</a></li>@endforeach</ul>
                    @if ($v->status === 'pending')
                        <form method="post" action="{{ route('admin.companies.verification.review', $v) }}" class="cus-form">@csrf
                            <div class="cus-field"><label for="rn-{{ $v->id }}">{{ translate('Reviewer notes (visible to the company)') }}</label><textarea class="cus-input" id="rn-{{ $v->id }}" name="reviewer_notes"></textarea></div>
                            <div class="cus-actions"><button class="cus-btn cus-btn--primary" name="decision" value="approve">{{ translate('Approve') }}</button><button class="cus-btn cus-btn--danger" name="decision" value="reject">{{ translate('Reject') }}</button></div>
                        </form>
                    @elseif ($v->reviewer_notes)<p><em>{{ $v->reviewer_notes }}</em></p>@endif
                </div></div>
        @endforeach
    </div>
@endsection
