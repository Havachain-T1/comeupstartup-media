@extends('core::base.layouts.master')

@section('title')
    {{ translate('Dashboard') }}
@endsection

@section('custom_css')
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/plugins/apex/apexcharts.css') }}">
@endsection

@section('main_content')
    @if (auth()->user()->can('Manage Dashboard'))
        @includeIf('theme/newslooks::backend.dashboard', $data)
    @endif
@endsection

@section('custom_scripts')
    <script src="{{ asset('/public/backend/assets/plugins/apex/apexcharts.min.js') }}"></script>
@endsection
