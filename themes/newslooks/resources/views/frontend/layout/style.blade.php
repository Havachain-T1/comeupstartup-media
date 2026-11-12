@php
    $theme_color = getThemeOption('theme_color', $active_theme->id);
@endphp

<!-- ==== Font Awesome ==== -->
<link rel="stylesheet" href="{{ asset('themes/newslooks/public/') }}/css/font-awesome.min.css ">
<link rel="stylesheet" href="{{ asset('public/css/brand/x-brand.css') }}">
<link rel="stylesheet" href="{{ asset('public/css/search/live-search.css') }}">

<!-- Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&family=Source+Sans+Pro:wght@400;600;700;900&display=swap">

<link rel="stylesheet" href="{{ asset('themes/newslooks/public/') }}/css/bootstrap.min.css">

<!-- ======= Main Stylesheet ======= -->
<link rel="stylesheet" href="{{ asset('themes/newslooks/public/') }}/css/style.css" />

<!-- ======= Custom Stylesheet ======= -->
<link rel="stylesheet" href="{{ asset('themes/newslooks/public/') }}/css/custom.css" />

@yield('custom-style')

@if ($theme_color['theme_primary_color'] != null)
    <link rel="stylesheet"
        href="{{ asset('themes/newslooks/public/css/theme-color.php') }}?color={{ str_replace('#', '', $theme_color['theme_primary_color']) }}">
@endif

@if ($rtl)
    <link rel="stylesheet" href="{{ asset('themes/newslooks/public/css/rtl.css') }}">
@endif

<!-- ======= Critical Theme Option CSS ======= -->
<link rel="stylesheet" href="{{ asset('themes/newslooks/public/theme-option/preloader.css') }}">
<!-- ======= Critical Theme Option CSS ====== -->

<link href="https://vjs.zencdn.net/8.0.4/video-js.css" rel="stylesheet" />
<style>
    .vjs-poster img {
        object-fit: cover !important;
    }

    .post-layout-3 .video-js .vjs-big-play-button {
        z-index: 99;
    }

    .player-section {
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        padding: 20px;
        color: white;
        width: 100%;
        height: 320px;
        align-items: center;
    }

    .post-layout-3 audio {
        margin-top: 40px !important;
        width: 94% !important;
        z-index: 999;
        position: absolute;
    }

    audio {
        margin-top: 120px;
        width: 100%;
    }

    .player-section:before {
        content: "";
        background-color: rgb(6 5 5 / 50%);
        top: 0;
        height: 100%;
        left: 0;
        width: 100%;
        position: absolute;
    }

    .nav .post-share {
        font-size: 14px !important;
    }
</style>
