@extends('portal.layout')
@section('title', __('Company profile'))
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head"><div><h1>{{ __('Company profile') }}</h1><p>{{ $company->name }}</p></div></div>
    <form class="cus-card" method="post" action="{{ route('company.update', $company) }}" novalidate>
        @csrf @method('PUT')
        <div class="cus-card__body cus-form">
            @include('company._form')
            <div class="cus-actions"><button class="cus-btn cus-btn--primary" type="submit">{{ __('Save changes') }}</button></div>
        </div>
    </form>
@endsection
