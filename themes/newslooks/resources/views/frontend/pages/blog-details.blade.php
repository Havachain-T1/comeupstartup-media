@php
    $layout = isset($single_blog_page['single_blog_layout']) ? $single_blog_page['single_blog_layout'] : 'l_one';
@endphp

@extends('theme/newslooks::frontend.layout.master')

@section('seo')
    {{-- SEO --}}
    <title>{{ $blog->translation('name', getFrontLocale()) }}</title>
    <meta name="title" content="{{ $blog->meta_title }}">
    <meta name="description" content="{{ $blog->meta_description }}">
    <meta name="keywords" content="{{ getGeneralSetting('site_meta_keywords') }}">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{{ $blog->meta_title }}">
    <meta property="og:description" content="{{ $blog->meta_description }}">
    <meta name="twitter:card" content="{{ $blog->meta_title }}">
    <meta name="twitter:title" content="{{ $blog->meta_title }}">
    <meta name="twitter:description" content="{{ $blog->meta_description }}">
    <meta name="twitter:image" content="{{ $blog->meta_image ? getFilePath($blog->meta_image) : '' }}">
    <meta property="og:image" content="{{ $blog->meta_image ? getFilePath($blog->meta_image) : '' }}">
    <meta property="og:image:width" content="1200">
@endsection

@section('content')
    <!-- Page Title -->
    <div class="page-title-wrap pt-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <ul class="breadcrumb nav">
                        <li><a href="{{ route('home') }}"><i
                                    class="fa fm fa-home mx-1"></i>{{ front_translate('Home') }}</a></li>
                        <li><a href="{{ route('theme.newslooks.blog.list') }}">{{ front_translate('Posts') }}</a>
                        </li>
                        <li class="active title-color-two">{{ $blog->translation('name', getFrontLocale()) }}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Page Title -->

    <!-- Main Content Section -->
    <section class="main-content--section pt-30 pb-30">
        @if (in_array($layout, ['l_one', 'l_two', 'l_three', 'l_four', 'l_six']))
            @include('theme/newslooks::frontend.includes.single-blog-page.layouts.' . $layout, [
                'blog' => $blog,
                'blog_shares' => $blog_shares,
                'single_blog_page' => $single_blog_page,
            ])
        @endif
        <div class="container">
            <!-- Main Content Wrap -->
            <div class="main-content--wrap">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Main Content -->
                        <div class="main--content">
                            @if ($layout == 'l_five')
                                @include(
                                    'theme/newslooks::frontend.includes.single-blog-page.layouts.l_five',
                                    [
                                        'blog' => $blog,
                                        'blog_shares' => $blog_shares,
                                        'single_blog_page' => $single_blog_page,
                                    ]
                                )
                            @endif

                            @if ($layout == 'l_seven')
                                @include(
                                    'theme/newslooks::frontend.includes.single-blog-page.layouts.l_seven',
                                    [
                                        'blog' => $blog,
                                        'blog_shares' => $blog_shares,
                                        'single_blog_page' => $single_blog_page,
                                    ]
                                )
                            @endif

                            @if ($layout == 'l_two')
                                <div class="post-title--wrap p-0 mb-30">
                                    @include(
                                        'theme/newslooks::frontend.includes.single-blog-page.post-title',
                                        [
                                            'blog' => $blog,
                                            'single_blog_page' => $single_blog_page,
                                        ]
                                    )
                                </div>
                            @endif

                            <!-- Post Single -->
                            <div class="post-single mb-30">
                                @if ($blog->visibility == 'password')
                                    <div class="row justify-content-center p-20">
                                        <div class="text-center mb-4">
                                            <h3>
                                                {{ front_translate('This Post is Password protected. Please Enter The Correct Password To Read The Post Content.') }}
                                            </h3>
                                        </div>
                                        <form action="#" method="post" class="col-10" id="blog_password_form">
                                            <input type="hidden" name="permalink" value="{{ $blog->permalink }}">
                                            <input type="password" name="password" id="password" class="theme-input-style"
                                                placeholder="Enter Password">
                                        </form>
                                    </div>
                                @else
                                    {!! fix_image_urls($blog->translation('content', getFrontLocale())) !!}
                                @endif
                            </div>
                            <!-- End Post Single -->

                            @if (isset($single_blog_page['tags']) && $single_blog_page['tags'] == 1)
                                <!-- Post Tags -->
                                <div class="post--cats pt-10 pb-30 mb-10">
                                    <ul class="nav p-0">
                                        @foreach ($blog->tags as $tag)
                                            <li>
                                                <a
                                                    href="{{ route('theme.newslooks.blog.blogByTag', $tag->permalink) }}">{{ $tag->translation('name', getFrontLocale()) }}</a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                                <!-- End Post Tags -->
                            @endif

                            @if (isset($single_blog_page['biography_info']) && $single_blog_page['biography_info'] == 1)
                                <!-- Post Author -->
                                <div class="post-author media mb-30">
                                    <!-- Author Thumb -->
                                    <div class="img-80 author_thumb">
                                        <img alt="user" data-src="{{ getFilePath($blog->user->image) }}"
                                            class="lazy">
                                    </div>
                                    <!-- End Author Thumb -->

                                    <!-- Author Info -->
                                    <div class="post-author--info media-body">
                                        <h4>{{ $blog->user->name }}</h4>
                                        <p>{{ isset($blog->user->info) && isset($blog->user->info->bio) ? front_translate($blog->user->info->bio) : '' }}
                                        </p>

                                        <div class="nav post-social align-items-center">
                                            @isset($socials)
                                                @foreach ($socials as $social)
                                                    @if ($social->social_icon != '')
                                                        @php
                                                            $logo_url = $social->social_icon_url;
                                                            if (
                                                                $social->social_icon_url === '' ||
                                                                $social->social_icon_url === '/'
                                                            ) {
                                                                $logo_url = url('/') . $social->social_icon_url;
                                                            }
                                                        @endphp
                                                        <a href="{{ $logo_url }}"><i
                                                                class="fa {{ $social->social_icon }}"></i></a>
                                                    @endif
                                                @endforeach
                                            @endisset
                                        </div>
                                    </div>
                                    <!-- Author Info -->
                                </div>
                                <!-- End Post Author -->
                            @endif

                            @if (isset($single_blog_page['post_navigation']) && $single_blog_page['post_navigation'] == 1)
                                <!-- Post Navigation -->
                                <nav class="nav post-navigation justify-content-between">
                                    <!-- Nav Previous -->
                                    <div class="nav-link nav-previous d-flex justify-content-start">
                                        @if ($previousBlog)
                                            <a
                                                href="{{ route('theme.newslooks.blog.details', $previousBlog->permalink) }}">
                                                <div
                                                    class="nav-title section-title has-bg-shape shape--two shape-bg--two mb-20">
                                                    <h5 class="title-color-two">{{ front_translate('Read Prev') }}</h5>
                                                </div>

                                                <div class="d-flex align-items-sm-center flex-column flex-sm-row">
                                                    @php
                                                        $small_variation = getImageVariation(
                                                            $previousBlog->image,
                                                            'small',
                                                        );
                                                    @endphp
                                                    <img data-src="{{ isset($previousBlog->image) ? $small_variation : '' }}"
                                                        class="mx-10 lazy" alt="blog-image">
                                                    <h5 class="post--title fw-regular">
                                                        {{ $previousBlog->translation('name', getFrontLocale()) }}</h5>
                                                </div>
                                            </a>
                                        @endif
                                    </div>
                                    <!-- End Nav Previous -->

                                    <!-- Nav Next -->
                                    <div class="nav-link nav-next d-flex justify-content-end">
                                        @if ($nextBlog)
                                            <a href="{{ route('theme.newslooks.blog.details', $nextBlog->permalink) }}"
                                                class="align-items-end d-flex flex-column">

                                                <div
                                                    class="nav-title section-title has-bg-shape shape--two shape-bg--two shape--end mb-20">
                                                    <h5 class="title-color-two">{{ front_translate('Read Next') }}</h5>
                                                </div>

                                                <div
                                                    class="d-flex align-items-sm-center align-items-end flex-column-reverse flex-sm-row">
                                                    <h5 class="post--title fw-regular text-right">
                                                        {{ $nextBlog->translation('name', getFrontLocale()) }}
                                                    </h5>
                                                    @php
                                                        $small_variation = getImageVariation($nextBlog->image, 'small');
                                                    @endphp
                                                    <img data-src="{{ isset($nextBlog->image) ? $small_variation : '' }}"
                                                        class="mx-10 lazy" alt="next-blog">
                                                </div>
                                            </a>
                                        @endif
                                    </div>
                                    <!-- End Nav Next -->
                                </nav>
                                <!-- End Post Navigation -->
                            @endif

                            @if (isset($single_blog_page['comments']) && $single_blog_page['comments'] == 1)
                                <!-- Comment -->
                                <div class="comment-section border-bottom pt-15" id="com">
                                    <div class="comments-area">

                                    </div>
                                </div>
                                <!-- End Comment -->

                                @if ($comment_setting['default_comment_status'] == '1')
                                    @if ($comment_setting['close_comments_for_old_blogs'] == '1' && commentClose($blog->publish_at) === true)
                                        <p class="post--title pt-30 text-center">{{ front_translate('Comments Closed') }}
                                        </p>
                                    @else
                                        @if ($comment_setting['comment_registration'] == '1' && !Auth::user())
                                            <!--If Not Registered -->
                                            <div class="pt-30">
                                                <p class="post--title text-center">
                                                    {{ front_translate('You Must be Registered Or Logged in To Comment') }}
                                                    <a href="{{ route('theme.newslooks.user.login') }}"
                                                        class="ml-2 c1">{{ front_translate('Log In') }}?</a>
                                                </p>
                                            </div>
                                            <!-- If Not Registered-->
                                        @else
                                            <!-- Comment Respond -->
                                            <div class="comment-respond pt-50" id="comment-box">
                                                <h3 class="comment-reply-title mb-1" id="comment-form-title">
                                                    {{ front_translate('Leave a Reply') }}
                                                    {{ Auth::check() ? 'as ' . Auth::user()->name : '' }}
                                                </h3>
                                                <a href="javascript:void(0)" id="cancel_comment"
                                                    class="h6 font-weight-bold d-none"
                                                    data-text="">{{ front_translate('Cancel Reply') }}</a>

                                                <form action="javascript:void(0)" class="comment-form mt-20">

                                                    <input type="hidden" name="blog_permalink" id="blog_permalink"
                                                        value="{{ $blog->permalink }}">

                                                    <input type="hidden" name="parent" id="parent_comment"
                                                        value="">

                                                    <div class="row">
                                                        @if (Auth::user())
                                                            <input type="hidden" name="user_id"
                                                                value="{{ Auth::user()->id }}">
                                                        @else
                                                            <p class="col-lg-12 comment-notes mb-25">
                                                                {{ front_translate('Your email address will not be published.') }}
                                                            </p>
                                                            @php
                                                                $options =
                                                                    $comment_setting['require_name_email'] == '1'
                                                                        ? ''
                                                                        : ' (' . front_translate('optional') . ')';
                                                            @endphp
                                                            <div class="col-lg-6">
                                                                <input class="theme-input-style mb-20" type="text"
                                                                    name="user_name" id="user_name"
                                                                    placeholder="{{ front_translate('Enter Name') . $options }}">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input class="theme-input-style mb-20" type="email"
                                                                    name="user_email" id="user_email"
                                                                    placeholder="{{ front_translate('Enter Email') . $options }}">
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <input class="theme-input-style mb-20" type="text"
                                                                    name="user_website" id="user_website"
                                                                    placeholder="{{ front_translate('Your Website (optional)') }}">
                                                            </div>
                                                        @endif
                                                        <div class="col-12">
                                                            <textarea class="theme-input-style mb-30" required="required" name="comment" id="comment"
                                                                placeholder="{{ front_translate('Enter Comments') }}"></textarea>
                                                        </div>
                                                    </div>

                                                    <button type="submit" class="btn"
                                                        id="comment_submit">{{ front_translate('Post Comment') }}</button>
                                                </form>
                                            </div>
                                            <!-- End Comment Respond -->
                                        @endif
                                    @endif
                                @endif
                            @endif

                        </div>
                        <!-- End Main Content -->

                        @if (isset($single_blog_page['related_blogs']) && $single_blog_page['related_blogs'] == 1)
                            <div class="row pt-60">
                                <div class="col-12">
                                    <!-- Section Title -->
                                    <div class="section-title has-bg-shape shape--two mb-30">
                                        <h2>{{ isset($single_blog_page['related_section_title']) ? front_translate($single_blog_page['related_section_title']) : '' }}
                                            </h5>
                                    </div>
                                    <!-- End Section Title -->

                                    <div class="post--items position-relative post-details-most-recent">
                                        <ul class="nav row p-0">
                                            @foreach ($relatedBlogs as $related_blog)
                                                <li class="col-md-4 col-sm-6">
                                                    <!-- Post Item -->
                                                    <div
                                                        class="post--item top-img-overlay category-on-image title-color-two c2-hover mb-30">
                                                        <!-- Image -->
                                                        <div class="position-relative">
                                                            @php
                                                                $small_variation = getImageVariation(
                                                                    $related_blog->image,
                                                                    'small',
                                                                );
                                                            @endphp
                                                            <a href="{{ route('theme.newslooks.blog.details', $related_blog->permalink) }}"
                                                                class="post--img mb-0">
                                                                <img data-src="{{ isset($small_variation) ? $small_variation : '' }}"
                                                                    alt="related blog" class="lazy">
                                                            </a>

                                                            @if (count($related_blog->categories))
                                                                <a class="post--category cat-btn text-uppercase title-font c2-bg c2-bo text-white"
                                                                    href="{{ route('theme.newslooks.blog.blogByCategory', $related_blog->categories->first()->permalink) }}">
                                                                    {{ $related_blog->categories->first()->name }}
                                                                </a>
                                                            @endif
                                                        </div>
                                                        <!-- End Image -->

                                                        <!-- Post Content -->
                                                        <div class="post--content">
                                                            <ul class="nav post--meta mt-0 mb-10">
                                                                <li>
                                                                    <a class="text-light c2-hover"
                                                                        href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($related_blog->publish_at, 'Y/m/d')) }}">
                                                                        <img class="svg mx-5"
                                                                            src="{{ asset('themes/newslooks/public/') }}/img/icon/clock.svg"
                                                                            alt="clock">
                                                                        {{ getFormatedDateTime($related_blog->publish_at, 'M d Y') }}
                                                                    </a>
                                                                </li>

                                                                <li>
                                                                    <span>
                                                                        <img class="svg mx-5 c1"
                                                                            src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                                                                            alt="count">
                                                                        {{ $related_blog->views }}
                                                                    </span>
                                                                </li>
                                                            </ul>
                                                            <h5 class="post--title mb-0">
                                                                <a
                                                                    href="{{ route('theme.newslooks.blog.details', $related_blog->permalink) }}">{{ $related_blog->name }}</a>
                                                            </h5>

                                                        </div>
                                                        <!-- End Post Content -->
                                                    </div>
                                                    <!-- End Post Item -->
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endif

                        @if (isset($single_blog_page['popular_blogs']) && $single_blog_page['popular_blogs'] == 1)
                            <div class="row pt-30">
                                <div class="col-12">
                                    <!-- Section Title -->
                                    <div class="section-title has-bg-shape shape--two mb-30">
                                        <h2>{{ isset($single_blog_page['popular_section_title']) ? front_translate($single_blog_page['popular_section_title']) : '' }}
                                            </h5>
                                    </div>
                                    <!-- End Section Title -->

                                    <div class="post--items position-relative post-details-most-popular">
                                        <ul class="nav row p-0">
                                            @foreach ($popularBlogs as $popular_blog)
                                                <li class="col-md-4 col-sm-6">
                                                    <!-- Post Item -->
                                                    <div
                                                        class="post--item top-img-overlay category-on-image title-color-two c2-hover mb-30">
                                                        <!-- Image -->
                                                        <div class="position-relative">
                                                            @php
                                                                $small_variation = getImageVariation(
                                                                    $popular_blog->image,
                                                                    'small',
                                                                );
                                                            @endphp
                                                            <a href="{{ route('theme.newslooks.blog.details', $popular_blog->permalink) }}"
                                                                class="post--img mb-0">
                                                                <img src="{{ isset($small_variation) ? $small_variation : '' }}"
                                                                    alt="{{ $popular_blog->name }}">
                                                            </a>

                                                            @if (count($popular_blog->categories))
                                                                <a class="post--category cat-btn text-uppercase title-font c2-bg c2-bo text-white"
                                                                    href="{{ route('theme.newslooks.blog.blogByCategory', $popular_blog->categories->first()->permalink) }}">{{ $popular_blog->categories->first()->name }}</a>
                                                            @endif
                                                        </div>
                                                        <!-- End Image -->

                                                        <!-- Post Content -->
                                                        <div class="post--content">
                                                            <ul class="nav post--meta mt-0 mb-10">
                                                                <li>
                                                                    <a class="text-light c2-hover"
                                                                        href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($popular_blog->publish_at, 'Y/m/d')) }}"><img
                                                                            class="svg mx-5"
                                                                            src="{{ asset('themes/newslooks/public/') }}/img/icon/clock.svg"
                                                                            alt="clock">{{ getFormatedDateTime($popular_blog->publish_at, 'M d Y') }}</a>
                                                                </li>

                                                                <li><span><img class="svg mx-5 c1"
                                                                            src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                                                                            alt="count">{{ $popular_blog->views }}</span>
                                                            </ul>
                                                            <h5 class="post--title mb-0">
                                                                <a
                                                                    href="{{ route('theme.newslooks.blog.details', $popular_blog->permalink) }}">{{ $popular_blog->name }}</a>
                                                            </h5>

                                                        </div>
                                                        <!-- End Post Content -->
                                                    </div>
                                                    <!-- End Post Item -->
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>

                    <div class="col-lg-4 mt-30 mt-lg-0">
                        @include('theme/newslooks::frontend.includes.sidebar.sidebar', [
                            'sidebar' => 'single_post_sidebar',
                        ])
                    </div>
                </div>
            </div>
            <!-- End Main Content Wrap -->
        </div>
    </section>
    <!-- End Main Content Section -->
@endsection

@section('custom-scripts')
    <script>
        (function($) {
            'use strict';
            let comment_section = '';
            let page = '';

            $(document).ready(function() {

                // Checking If Comment Is Paginated Is Here
                if ('{{ request()->page }}') {
                    page = '{{ request()->page }}';
                }

                // Password Blog
                if ("{{ $blog->visibility }}" == 'password') {
                    let cookie_data = Cookies.get('{{ $blog->permalink }}') ? JSON.parse(Cookies.get(
                        '{{ $blog->permalink }}')) : null;

                    if (cookie_data != null && cookie_data.blog == '{{ $blog->permalink }}') {
                        let formData = $('#blog_password_form').serializeArray();
                        // extra field to check if user already got content and here is true
                        formData.push({
                            name: 'is_authenticate',
                            value: 'true'
                        });
                        getBlogContent(formData, true);
                    }
                } else {
                    // Load Comment Function
                    commentLoad(page);
                }

            });

            // Get Blog Content On Right Password And Setting Cookie    
            $('#password').on('keypress', function(e) {
                if (e.which === 13) {
                    e.preventDefault();

                    let formData = $('#blog_password_form').serializeArray();
                    // extra field to check if user already got content and here is false
                    formData.push({
                        name: 'is_authenticate',
                        value: 'false'
                    });
                    getBlogContent(formData, false);
                }
            });

            // Load Comment Function
            function commentLoad(page) {
                $.ajax({
                    type: "post",
                    url: "{{ route('theme.newslooks.blog.comment.load') }}" + "?permalink=" +
                        "{{ $blog->permalink }}" + "&page=" + page,
                    success: function(res) {
                        if (res.success) {

                            $('.comments-area').html(res.view);
                            if (page !== '') {
                                let targetSection = document.getElementsByClassName("comment-section");
                                window.scrollTo({
                                    top: targetSection.offsetTop,
                                    behavior: "smooth"
                                });
                            }
                        } else {
                            toastr.error(res.error, "{{ front_translate('Error!') }}");
                        }
                    },
                    error: function(jqXHR, exception) {
                        toastr.error("{{ front_translate('Comment Request Failed') }}",
                            "{{ front_translate('Error!') }}");
                    }
                });
            }

            // Create Comment
            $(document).on('click', '#comment_submit', function() {
                $(this).prop('disabled', true);
                let formData = $('.comment-form').serializeArray();
                let parent = $('#parent_comment').val();
                createComment(formData, parent, page);
            });

            // Get Blog Content For Password Protected Blog
            function getBlogContent(formData, comment_section) {
                $.ajax({
                    type: "post",
                    url: '{{ route('theme.newslooks.blog.password.load') }}',
                    data: formData,
                    success: function(res) {
                        if (res.success) {
                            $('.post-single').html(res.content);
                            // cookie expire in 1 day
                            Cookies.set('{{ $blog->permalink }}', JSON.stringify({
                                blog: "{{ $blog->permalink }}"
                            }), {
                                expires: 1,
                                path: '{{ env('APP_URL') }}'
                            });
                            commentLoad(page);
                        } else {
                            toastr.error(res.error, "{{ front_translate('Error!') }}");
                        }
                    },
                    error: function(data, textStatus, jqXHR) {
                        toastr.error("{{ front_translate('Content Request Failed') }}",
                            "{{ front_translate('Error!') }}");
                    }
                });
            }

            // Create Comment Function
            function createComment(formData, parent, page) {
                $.ajax({
                    type: "post",
                    url: "{{ route('theme.newslooks.blog.comment.create') }}",
                    data: formData,
                    success: function(res) {
                        if (res.success) {
                            toastr.success(res.success, "{{ front_translate('Success!') }}");
                            if (parent === '') {
                                window.location =
                                    "{{ route('theme.newslooks.blog.details', $blog->permalink) }}" +
                                    "?page=" + 1;
                            } else {
                                window.location =
                                    "{{ route('theme.newslooks.blog.details', $blog->permalink) }}" +
                                    "?page=" + page;
                            }
                        } else {
                            if (res.warning) {
                                $('#user_name').val('');
                                $('#user_email').val('');
                                $('#user_website').val('');
                                $('#comment').val('');
                                toastr.warning(res.warning, "{{ front_translate('Warning!') }}");
                            }
                            if (res.pending) {
                                $('#user_name').val('');
                                $('#user_email').val('');
                                $('#user_website').val('');
                                $('#comment').val('');
                                toastr.info(res.pending, "{{ front_translate('Pending!') }}");
                            }
                            if (res.error) {
                                toastr.error(res.error, "{{ front_translate('Error!') }}");
                            }
                            $('#comment_submit').prop('disabled', false);
                        }
                    },
                    error: function(data, textStatus, jqXHR) {
                        toastr.error("{{ front_translate('Comment Submit Failed') }}" + textStatus,
                            "{{ front_translate('Error!') }}");
                        $('#comment_submit').prop('disabled', false);
                    }
                });
            }

            // reply btn click gotoview comment form
            $(document).on('click', '.reply-btn', function() {
                let parent = $(this).data('id');
                let name = $(this).data('username');

                let prev_title_text = $('#comment-form-title').text().trim();

                $('#comment-form-title').text("{{ front_translate('Leave a Reply to') }} " + name);
                $('#cancel_comment').removeClass('d-none');
                $('#cancel_comment').attr('data-text', prev_title_text);
                $('#parent_comment').val(parent);

                document.getElementById("comment-box").scrollIntoView({
                    behavior: "smooth"
                });
            });

            // cancel a comment reply
            $(document).on('click', "#cancel_comment", function() {
                $('#comment-form-title').text($(this).data('text'));
                $('#cancel_comment').addClass('d-none');
                $('#parent_comment').val('');
            });

            // more comment button click arrow up and down
            $(document).on('click', '.more_comment_btn', function() {
                let collapsed = $(this).attr('class');
                if (!$(this).hasClass('collapsed')) {
                    $(this).find('i').removeClass('fa-angle-down').addClass('fa-angle-up');
                } else {
                    $(this).find('i').removeClass('fa-angle-up').addClass('fa-angle-down');
                }
            });
        })(jQuery);
    </script>
@endsection
