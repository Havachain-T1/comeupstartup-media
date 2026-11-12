@extends('theme/newslooks::frontend.layout.master')
@section('seo')
    <title>@yield('title') | {{ config('app.name') }}</title>
    <meta name="robots" content="noindex">
    <link rel="stylesheet" href="{{ asset('public/css/portal/portal.css') }}">
@endsection
@section('content')
    <main class="cus-portal" id="main-content">
        <div class="cus-container">
            @if (session('status'))
                <div class="cus-alert cus-alert--success" role="status">{{ session('status') }}</div>
            @endif
            @if (session('error'))
                <div class="cus-alert cus-alert--danger" role="alert">{{ session('error') }}</div>
            @endif
            @if ($errors->any())
                <div class="cus-alert cus-alert--danger" role="alert">
                    <strong>{{ __('Please correct the following:') }}</strong>
                    <ul>
                        @foreach ($errors->all() as $message)
                            <li>{{ $message }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            @hasSection('sidebar')
                <div class="cus-layout">
                    <nav class="cus-nav" aria-label="{{ __('Section navigation') }}">@yield('sidebar')</nav>
                    <div>@yield('portal')</div>
                </div>
            @else
                @yield('portal')
            @endif
        </div>
    </main>
@endsection
