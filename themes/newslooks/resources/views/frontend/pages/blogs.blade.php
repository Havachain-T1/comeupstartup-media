@php
    $blog_layout =
        isset($blog_options['blog_layout']) && !empty($blog_options['blog_layout'])
            ? $blog_options['blog_layout']
            : 'right_sidebar_layout';

    $blog_colum =
        isset($blog_options['blog_colum']) && !empty($blog_options['blog_colum'])
            ? $blog_options['blog_colum']
            : 'col-lg-12';

    $blog_post_style =
        isset($blog_options['blog_post_style']) && !empty($blog_options['blog_post_style'])
            ? $blog_options['blog_post_style']
            : 's_one';

    $read_more = front_translate('Read More');
    if (isset($blog_options['read_more_text_setting']) && $blog_options['read_more_text_setting'] == 'custom') {
        $read_more = isset($blog_options['read_more_text']) ? front_translate($blog_options['read_more_text']) : '';
    }

    $blog_excerpt =
        isset($blog_options['blog_posts_excerpt']) && !empty($blog_options['blog_posts_excerpt'])
            ? $blog_options['blog_posts_excerpt']
            : 50;

    $pagination_type = isset($blog_options['blog_pagination_setting'])
        ? $blog_options['blog_pagination_setting']
        : 'number';

    $pagination_alignment = isset($blog_options['blog_pagination_position'])
        ? $blog_options['blog_pagination_position']
        : 'center';

    $generalSettings = getGeneralSettingsDetails();

    // Seo Setting by filter
    $filterSeo = false;
    if (isset($type) && in_array($type, ['category', 'tag'])) {
        $typeData = $type == 'category' ? $category : $tag;
        $seoInfo = blogFilterSeo($typeData);
        $filterSeo = true;
        $seoInfo['site_meta_keywords'] = $generalSettings['site_meta_keywords'];
    } else {
        $seoInfo = $generalSettings;
    }
@endphp

@extends('theme/newslooks::frontend.layout.master')

@section('seo')
    {{-- SEO --}}
    <title> {{ $filterSeo ? $seoInfo['filter_name'] . ' - ' . front_translate('Posts') : front_translate('Posts') }}
    </title>
    <meta name="title" content="{{ $seoInfo['site_meta_title'] ?? 'Blogs' }}">
    <meta name="description" content="{{ $seoInfo['site_meta_description'] }}">
    <meta name="keywords" content="{{ $seoInfo['site_meta_keywords'] }}">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{{ $seoInfo['site_meta_title'] ?? 'Blogs' }}">
    <meta property="og:description" content="{{ $seoInfo['site_meta_description'] }}">
    <meta name="twitter:card" content="{{ $seoInfo['site_meta_description'] }}">
    <meta name="twitter:title" content="{{ $seoInfo['site_meta_title'] ?? 'Blogs' }}">
    <meta name="twitter:description" content="{{ $seoInfo['site_meta_description'] }}">
    <meta name="twitter:image"
        content="{{ $seoInfo['site_meta_image'] ? getFilePath($seoInfo['site_meta_image']) : getFilePath($generalSettings['site_meta_image']) }}">
    <meta property="og:image"
        content="{{ $seoInfo['site_meta_image'] ? getFilePath($seoInfo['site_meta_image']) : getFilePath($generalSettings['site_meta_image']) }}">
@endsection

@section('content')
    <!-- Page Title -->
    <div class="page-title-wrap pt-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <ul class="breadcrumb nav">
                        <li><a href="{{ route('home') }}"><i
                                    class="fa fm fa-home mx-1"></i>{{ front_translate('Home') }}</a>
                        </li>
                        <li class="active"><span>{{ front_translate('Posts') }}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Page Title -->

    <section class="pt-60 pb-30" id="post-list-content">
        <div class="container">
            <div class="row">
                @if (isset($type))
                    <div class="col-12 mb-25">
                        @switch($type)
                            @case('category')
                                <h3>{{ front_translate('Category') }} : {{ $category->translation('name', getFrontLocale()) }}
                                </h3>
                            @break

                            @case('tag')
                                <h3>{{ front_translate('Tag') }} : {{ $tag->translation('name', getFrontLocale()) }}</h3>
                            @break

                            @case('search')
                                <h3>{{ front_translate('Search') }} : {{ $text }}</h3>
                            @break

                            @case('author')
                                <h3>{{ front_translate('Author') }} : {{ $author_name }}</h3>
                            @break

                            @case('date')
                                <h3>{{ front_translate('Date') }} : {{ getFormatedDateTime($date, 'd M y') }}</h3>
                            @break

                            @case('filter')
                                <h3>{{ front_translate($filter_text) }}</h3>
                            @break
                        @endswitch
                    </div>
                @endif

                <div
                    class="col-lg-8 {{ $blog_layout == 'full_layout' ? 'col-lg-12' : 'col-lg-8' }} {{ $blog_layout == 'left_sidebar_layout' ? 'order-2' : 'order-1' }} mt-15">
                    <div class="row">
                        @foreach ($blogs as $blog)
                            <div class="{{ $blog_colum }}">
                                @include(
                                    'theme/newslooks::frontend.includes.post-styles.' . $blog_post_style,
                                    [
                                        'blog' => $blog,
                                        'read_more' => $read_more,
                                        'blog_excerpt' => $blog_excerpt,
                                    ]
                                )
                            </div>
                        @endforeach

                        <div class="col-12">
                            <!-- Post Pagination -->
                            @if ($blogs->lastPage() == 1)
                                <h4 class="mt-5 text-center">{{ front_translate('No More Posts') }}</h4>
                            @else
                                @php
                                    if (isset($type)) {
                                        if ($type == 'category') {
                                            $route = route('theme.newslooks.blog.blogByCategory', $category->permalink);
                                        } elseif ($type == 'tag') {
                                            $route = route('theme.newslooks.blog.blogByTag', $tag->permalink);
                                        } elseif ($type == 'search') {
                                            $route = route('theme.newslooks.blog.blogBySearch', $text);
                                        } elseif ($type == 'author') {
                                            $route = route('theme.newslooks.blog.blogByAuthor', $author);
                                        } elseif ($type == 'date') {
                                            $route = route('theme.newslooks.blog.blogByDate', $date);
                                        } elseif ($type == 'filter') {
                                            $route = route('theme.newslooks.blog.blogByFilter', $filter);
                                        } else {
                                            $route = route('theme.newslooks.blog.list');
                                        }
                                    } else {
                                        $route = route('theme.newslooks.blog.list');
                                    }
                                @endphp
                                @include('theme/newslooks::frontend.includes.blog-pagination', [
                                    'blogs' => $blogs,
                                    'route' => $route,
                                    'pagination_type' => $pagination_type,
                                    'pagination_alignment' => $pagination_alignment,
                                ])
                            @endif
                            <!-- End of Post Pagination -->
                        </div>
                    </div>
                </div>

                @if ($blog_layout != 'full_layout')
                    <div class="col-lg-4 {{ $blog_layout == 'left_sidebar_layout' ? 'order-1' : 'order-2' }}">
                        @include('theme/newslooks::frontend.includes.sidebar.sidebar', [
                            'sidebar' => 'post_page_sidebar',
                        ])
                    </div>
            </div>
            @endif
        </div>
    </section>
    <!-- Page Title -->
@endsection
