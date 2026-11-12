@php
    $generalSettings = getGeneralSettingsDetails();

    $master = isActivePluging('newslooks-pagebuilder') && $page->page_type == 'builder' ? 'builder-master' : 'master';
@endphp

{{-- Extends Buildr Master If Page is From Builder --}}
@extends('theme/newslooks::frontend.layout.' . $master)

@section('seo')
    {{-- SEO --}}
    <title>{{ $page->translation('title', getFrontLocale()) }}</title>
    <meta name="title" content="{{ $page->meta_title }}">
    <meta name="description" content="{{ $page->meta_description }}">
    <meta name="keywords" content="{{ getGeneralSetting('site_meta_keywords') }}">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{{ $page->meta_title }}">
    <meta property="og:description" content="{{ $page->meta_description }}">
    <meta name="twitter:card" content="{{ $page->meta_title }}">
    <meta name="twitter:title" content="{{ $page->meta_title }}">
    <meta name="twitter:description" content="{{ $page->meta_description }}">
    <meta name="twitter:image" content="{{ $page->meta_image ? getFilePath($page->meta_image) : '' }}">
    <meta property="og:image" content="{{ $page->meta_image ? getFilePath($page->meta_image) : '' }}">
    <meta property="og:image:width" content="1200">
@endsection

@section('custom-style')
    @php
        $builder_css_file = base_path("themes/{$active_theme->location}/public/builder-assets/css/{$page->id}.css");
        $builder_css_path = asset("themes/{$active_theme->location}/public/builder-assets/css/{$page->id}.css");
    @endphp
    @if (isActivePluging('newslooks-pagebuilder') && $page->page_type == 'builder' && file_exists($builder_css_file))
        <link rel="stylesheet" href="{{ $builder_css_path . '?v=' . time() }}">
    @endif
@endsection

@section('content')

    @if (isActivePluging('newslooks-pagebuilder') && $page->page_type == 'builder')
        @includeIf('plugin/newslooks-pagebuilder::builders.builder-section', [
            'page_sections' => $page_sections,
        ])
    @else
        <!-- Main Breadcrumb Start -->
        @if (isset($pageOption['page_breadcrumb']) && $pageOption['page_breadcrumb'] == 1)
            <div class="page-title-wrap pt-30">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <ul class="breadcrumb nav">
                                <li><a href="{{ route('home') }}"><i class="fa fm fa-home mx-1"></i>{{ front_translate('Home') }}</a></li>
                                <li class="active"><span>{{ $page->translation('title', getFrontLocale()) }}</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        @endif
        <!-- Main Breadcrumb End -->

        <!-- Main Content Section Start -->
        <div class="main-content--section pt-30 pb-30">
            <div class="container page-section">
                @if ($page->visibility == 'password')
                    <div class="row justify-content-center p-20" id="password_box">
                        <div class="text-center mb-4">
                            <h3>
                                {{ front_translate('This Page is Password Protected. Please Enter The Correct Password To View Page Content.') }}
                            </h3>
                        </div>
                        <form action="#" method="post" class="col-10" id="page_password_form">
                            <input type="hidden" name="permalink" value="{{ $page->permalink }}">
                            <input type="password" name="password" id="page_password" class="theme-input-style"
                                placeholder="Enter Password">
                        </form>
                    </div>
                @endif

                <div id="page_details">
                    @if (isset($page->page_image))
                        <div class="page-featured-image">
                            <img data-src="{{ getFilePath($page->page_image) }}" alt="image" class="img-fluid lazy">
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

@section('custom-scripts')
    <script>
        (function($) {
            'use strict';

            $(document).ready(function() {
                let page_details;
                // if page is password protected then remove the contents
                if ('{{ $page->visibility }}' == 'password') {
                    page_details = $('#page_details').detach();
                }

                // checking if page cookie is available and getting it (For password protected page)
                if (Cookies.get('{{ $page->permalink }}')) {
                    $('#password_box').remove();
                    $('.page-section').html(page_details);
                }

                // if the blog is password protected
                $('#page_password').on('keypress', function(e) {
                    if (e.which === 13) {
                        e.preventDefault();

                        let formData = $('#page_password_form').serializeArray();
                        $.ajax({
                            type: "post",
                            url: '{{ route('theme.newslooks.page.password.load') }}',
                            data: formData,
                            success: function(res) {
                                if (res.success) {
                                    $('#password_box').remove();
                                    $('.page-section').html(page_details);
                                    // Cookies expired on 1 day
                                    Cookies.set('{{ $page->permalink }}', JSON.stringify({
                                        page: "{{ $page->permalink }}"
                                    }), {
                                        expires: 1,
                                        path: '{{ env('APP_URL') }}'
                                    });
                                } else {
                                    toastr.error(res.error,
                                        "{{ front_translate('Error!') }}");
                                }
                            },
                            error: function(data, textStatus, jqXHR) {
                                toastr.error("Content Request Failed",
                                    "{{ front_translate('Error!') }}");
                            }
                        });
                    }
                });
            });

        })(jQuery);
    </script>
@endsection
