@php
    $page_404 = getThemeOption('page_404', $active_theme->id);
@endphp
@extends('theme/newslooks::frontend.layout.master')

@section('seo')
    {{-- SEO --}}
    <title>404</title>
    <meta name="title" content="{{ getGeneralSetting('site_meta_title') }}">
    <meta name="description" content="{{ getGeneralSetting('site_meta_description') }}">
@endsection

@section('content')
    <!-- Main Breadcrumb Start -->
    <div class="page-title-wrap pt-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <ul class="breadcrumb nav">
                        <li><a href="{{ route('home') }}"><i class="fa fm fa-home"></i>{{ front_translate('Home') }}</a>
                        </li>
                        <li class="active"><span>404</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Breadcrumb End -->

    <!-- Main Content Section Start -->
    <section class="pt-60 pb-60">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Content 404 -->
                    <div class="content-404 text-center">

                        @if (isset($page_404['page_404_image']))
                            <img src="{{ getFilePath($page_404['page_404_image']) }}" alt="404 Page">
                        @endif

                        @if (isset($page_404['page_404_title']) && $page_404['page_404_title'] != '')
                            <h2>{{ front_translate($page_404['page_404_title']) }}</h2>
                        @endif

                        @if (isset($page_404['page_404_subtitle']) && $page_404['page_404_subtitle'] != '')
                            <p>{{ front_translate($page_404['page_404_subtitle']) }}</p>
                        @endif

                        @if (isset($page_404['page_404_button_text']) && $page_404['page_404_button_text'] != '')
                            <a class="btn" href="{{ route('home') }}">{{ front_translate($page_404['page_404_button_text']) }}</a>
                        @endif

                    </div>
                    <!-- End Content 404 -->
                </div>
            </div>
        </div>
    </section>
@endsection
