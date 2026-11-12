@extends('portal.layout')
@section('title', __('Register a company'))
@section('portal')
    <div class="cus-page-head"><div>
        <div class="cus-breadcrumb"><a href="{{ route('company.index') }}">{{ __('Companies') }}</a> / {{ __('Register') }}</div>
        <h1>{{ __('Register a company') }}</h1>
        <p>{{ __('You will become the owner of this company account and can invite your team afterwards.') }}</p>
    </div></div>
    <form class="cus-card" method="post" action="{{ route('company.store') }}" novalidate>
        @csrf
        <div class="cus-card__body cus-form">
            @include('company._form', ['company' => null])
            <div class="cus-actions"><button class="cus-btn cus-btn--primary" type="submit">{{ __('Register company') }}</button>
                <a class="cus-btn cus-btn--secondary" href="{{ route('company.index') }}">{{ __('Cancel') }}</a></div>
        </div>
    </form>
@endsection
