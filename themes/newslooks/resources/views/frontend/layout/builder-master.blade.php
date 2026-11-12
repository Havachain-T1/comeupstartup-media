@php
    $generalSettings = getGeneralSettingsDetails();

    $custom_scripts = getThemeOption('custom_scripts', $active_theme->id);

    $rtl = getActiveFrontLangRTL();
@endphp

<!DOCTYPE html>
<html lang="en" dir="{{ $rtl ? 'rtl' : '' }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="_token" content="{{ csrf_token() }}">

    @yield('seo')

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png"
        href="{{ isset($generalSettings['favicon']) ? $generalSettings['favicon'] : '' }}">

    <!-- ==== Include Styles ==== -->
    @include('theme/newslooks::frontend.layout.style')

    <!-- Including all google fonts link -->
    @includeIf('theme/newslooks::frontend.includes.typography.google-font-link')

    <!-- Including all dynamic css -->
    @includeIf('theme/newslooks::frontend.includes.typography.typography-css')

    <!-- Custom Scripts Header -->
    {!! isset($custom_scripts['header_custom_js_code']) ? $custom_scripts['header_custom_js_code'] : '' !!}
    <!-- Custom Scripts Header End -->
</head>

<body class="@if ($rtl) rtl-mode @endif">
    <a class="cus-skip-link" href="#main-content">{{ translate('Skip to content') }}</a>

    <!-- Preloader Start -->
    @include('theme/newslooks::frontend.includes.preloader')
    <!-- Preloader End -->

    <!-- Wrapper Start -->
    <main id="main-content" tabindex="-1">
        <!-- Main Content Section Start -->
        @yield('content')
        <!-- Main Content Section End -->
    </main>
    <!-- Wrapper End -->

    <!-- GDPR Cookie Start -->
    @include('theme/newslooks::frontend.includes.gdpr-cookie')
    <!-- GDPR Cookie End -->

    <!-- Back To Top Button Start -->
    @include('theme/newslooks::frontend.includes.back_to_top')
    <!-- Back To Top Button End -->

    <!-- Website Popup Start -->
    @include('theme/newslooks::frontend.includes.website-popup')
    <!-- Website Popup End -->

    <!-- Non Critical CSS Files Start -->

    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/back_to_top.css') }}">
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/header.css') }}">
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/sidebar_options.css') }}">
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/subscribe.css') }}">
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/page_404.css') }}">
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/custom_css.css') }}">
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/css/toaster.min.css') }}">
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/') }}/plugins/simplebar/simplebar.min.css" />
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/') }}/plugins/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/') }}/plugins/magnific-popup/magnific-popup.css" />
    <!-- Non Critical CSS Files End -->

    <!-- Include Scripts -->
    @include('theme/newslooks::frontend.layout.scripts')

    <!-- Custom Scripts Footer -->
    {!! isset($custom_scripts['footer_custom_js_code']) ? $custom_scripts['footer_custom_js_code'] : '' !!}
    <!-- Custom Scripts Footer End -->
</body>

</html>
