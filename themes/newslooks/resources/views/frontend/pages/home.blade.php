@php
    $generalSettings = getGeneralSettingsDetails();
    $master = isActivePluging('newslooks-pagebuilder') && isset($page) && $page->page_type == 'builder' ? 'builder-master' : 'master';
@endphp

{{-- Extends Buildr Master If Page is From Builder --}}
@extends('theme/newslooks::frontend.layout.' . $master)

@section('seo')
    {{-- SEO  --}}
    <title>{{ $generalSettings['system_name'] . ' - ' . $generalSettings['site_moto'] }}</title>
    <meta name="title" content="{{ $generalSettings['site_meta_title'] ? $generalSettings['site_meta_title'] : $title }}">
    <meta name="description" content="{{ $generalSettings['site_meta_description'] }}">
    <meta name="keywords" content="{{ $generalSettings['site_meta_keywords'] }}">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{{ $generalSettings['site_meta_title'] }}">
    <meta property="og:description" content="{{ $generalSettings['site_meta_description'] }}">
    <meta name="twitter:card" content="{{ $generalSettings['site_meta_description'] }}">
    <meta name="twitter:title" content="{{ $generalSettings['site_meta_title'] }}">
    <meta name="twitter:description" content="{{ $generalSettings['site_meta_description'] }}">
    <meta name="twitter:image" content="{{ getFilePath($generalSettings['site_meta_image']) }}">
    <meta property="og:image" content="{{ getFilePath($generalSettings['site_meta_image']) }}">
    <meta property="og:image:width" content="1200">
@endsection

@section('custom-style')
    @php
        $builder_css_file = base_path("themes/{$active_theme->location}/public/builder-assets/css/{$page->id}.css");
        $builder_css_path = asset("themes/{$active_theme->location}/public/builder-assets/css/{$page->id}.css");
    @endphp
    @if (isActivePluging('newslooks-pagebuilder') &&
            isset($page) &&
            $page->page_type == 'builder' &&
            file_exists($builder_css_file))
        <link rel="stylesheet" href="{{ $builder_css_path . '?v=' . time() }}">
    @endif
@endsection

@section('content')
    @if (isActivePluging('newslooks-pagebuilder') && isset($page) && $page->page_type == 'builder')
        @includeIf('plugin/newslooks-pagebuilder::builders.builder-section', [
            'page_sections' => $page_sections,
        ])
    @else
        <!-- Main Content Section Start -->
        <div class="main-content--section pt-30 pb-30">
            <div class="container page-section">
                <div id="page_details">
                    @if (isset($page->page_image))
                        <div class="page-featured-image">
                            <img data-src="{{ getFilePath($page->page_image) }}" alt="page image" class="img-fluid lazy">
                        </div>
                    @endif

                    <div class="page-content pt-20">
                        {!! xss_clean(fix_image_urls($page->translation('content', getFrontLocale()))) !!}
                    </div>
                </div>
            </div>
        </div>
    @endif
    
@endsection
