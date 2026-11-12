<!-- Breaking News In Top -->
@if (isset($headerOption['header_h1_breaking_position']) && $headerOption['header_h1_breaking_position'] == 'top')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h1'])
@endif
<!-- End Breaking News -->

<!-- Header -->
<header class="header">

    <!-- Search -->
    @include('theme/newslooks::frontend.includes.headers.search')
    <!-- Search -->

    @if (isset($headerOption['header_top_h1']) && $headerOption['header_top_h1'] == 1)
        <!-- Header Top -->
        @include('theme/newslooks::frontend.includes.headers.header-top', ['variant' => 'h1'])
        <!-- Header Top -->
    @endif

    <!-- Header Middle -->
    <div class="header-top c1-bg py-15 py-lg-0" id="header_middle_h1">
        <div class="container">
            <div class="row align-items-center justify-content-between position-relative">
                <div class="col-auto position-static">
                    <div class="d-flex align-items-center">
                        @include('theme/newslooks::frontend.includes.headers.mobile-menu', [
                            'main_menuTree' => $main_menuTree,
                            'text_color' => 'text-white'
                        ])
                    </div>

                    <!-- Horizontal Menu -->
                    <div class="horizontal-menu list-has-separator d-none d-lg-block">
                        @include('theme/newslooks::frontend.includes.headers.menu', [
                            'main_menuTree' => $main_menuTree,
                            'list' => 'nav',
                            'text_color' => 'text-white'
                        ])
                    </div>
                    <!-- End Horizontal Menu -->
                </div>

                <div class="col-auto">
                    <!-- Header Right -->
                    <div class="header-right-menu list-has-separator">
                        <ul class="nav align-items-center">
                            <li>
                                <a href="{{ route('theme.newslooks.user.login') }}" class="text-white" aria-label="User-Account">
                                    <img src="{{ asset('themes/newslooks/public/') }}/img/icon/user.svg" class="svg"
                                        alt="User-Account">
                                </a>
                            </li>

                            <li>
                                <!-- Menu Trigger -->
                                <button class="menu-trigger-btn text-white" data-toggle="offCanvas"
                                    data-target="offcanvasBlog" aria-label="search-button">
                                    <img class="svg"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/search.svg"
                                        alt="search">
                                </button>
                                <!-- End Menu Trigger -->
                            </li>
                        </ul>
                    </div>
                    <!-- End Header Right -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Header -->

    <!-- Header Bottom -->
    <div class="header-bottom py-30" id="header_bottom_h1">
        <div class="container">
            <div class="row align-items-center">

                <div class="col-md-6 text-center text-sm-left">
                    <!-- Logo -->
                    <a class="logo" href="{{ route('home') }}">
                        <img src="{{ $logo }}" alt="logo">
                    </a>
                    <!-- End Logo -->
                </div>

                @if (isset($headerOption['header_bottom_h1_social']) && $headerOption['header_bottom_h1_social'] == 1)
                    <div class="col-sm-6 d-none d-md-block">
                        <!-- Widget socials -->
                        <div class="widget widget-socials with-border d-flex justify-content-end">
                            @include('theme/newslooks::frontend.includes.socials.social')
                        </div>
                        <!-- Widget socials -->
                    </div>
                @endif
            </div>
        </div>
    </div>
    <!-- End Header Bottom -->
</header>
<!-- End Header -->

<!-- Breaking News In Bottom -->
@if (isset($headerOption['header_h1_breaking_position']) && $headerOption['header_h1_breaking_position'] == 'bottom')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h1'])
@endif
<!-- End Breaking News -->
