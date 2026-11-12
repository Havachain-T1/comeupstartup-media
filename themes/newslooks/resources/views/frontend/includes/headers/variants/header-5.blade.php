<!-- Breaking News In Top -->
@if (isset($headerOption['header_h5_breaking_position']) && $headerOption['header_h5_breaking_position'] == 'top')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h5'])
@endif
<!-- End Breaking News -->

<!-- Header -->
<header class="header">

    <!-- Search -->
    @include('theme/newslooks::frontend.includes.headers.search')
    <!-- Search -->

    @if (isset($headerOption['header_top_h5']) && $headerOption['header_top_h5'] == 1)
        <!-- Header Top -->
        @include('theme/newslooks::frontend.includes.headers.header-top', ['variant' => 'h5'])
        <!-- Header Top -->
    @endif

    <!-- Header Middle -->
    <div class="header-top py-15 d-none d-lg-block" id="header_middle_h5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4">
                    <!-- Widget Socials -->
                    <div
                        class="widget widget-socials with-border d-flex justify-content-center justify-content-sm-start">
                        @include('theme/newslooks::frontend.includes.socials.social')
                    </div>
                    <!-- Widget Socials -->
                </div>
                <div class="col-md-4 text-center">
                    <!-- Logo -->
                    <!-- Logo -->
                    <a class="logo" href="{{ route('home') }}">
                        <img src="{{ $logo }}" alt="logo">
                    </a>
                    <!-- End Logo -->
                </div>
                <div class="col-md-4">
                    <!-- Header Right -->
                    <div class="header-right-menu list-has-separator">
                        <ul class="nav align-items-center justify-content-end">
                            <li>
                                <a href="{{ route('theme.newslooks.user.login') }}" class="">
                                    <img src="{{ asset('themes/newslooks/public/') }}/img/icon/user.svg" class="svg"
                                        alt="user">
                                </a>
                            </li>

                            <li>
                                <!-- Menu Trigger -->
                                <button class="menu-trigger-btn" data-toggle="offCanvas"
                                    data-target="offcanvasBlog" aria-label="search-button">
                                    <img class="svg"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/search.svg"
                                        alt="user">
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
    <!-- End Header Middle -->

    <!-- Header Bottom -->
    <div class="header-bottom" id="header_bottom_h5">
        <div class="container">
            <div class="h5-bg radius-5 position-relative">
                <div class="row justify-content-center">
                    <div class="col-lg-10 position-static">
                        <div class="d-flex align-items-center justify-content-between d-lg-none  p-15 p-lg-0">
                            <div class="col-2">
                                <!-- Mobile Menu -->
                                @include('theme/newslooks::frontend.includes.headers.mobile-menu', [
                                    'main_menuTree' => $main_menuTree,
                                    'text_color' => 'text-dark'
                                ])
                            </div>
        
                            <div class="col-6 text-center">
                                <!-- Logo -->
                                <a class="logo" href="{{ route('home') }}">
                                    <img src="{{ $logo }}" alt="logo">
                                </a>
                                <!-- End Logo -->
                            </div>
        
                            <div class="col-auto">
                                <!-- Header Right -->
                                <div class="header-right-menu list-has-separator">
                                    <ul class="nav align-items-center justify-content-end">
                                        <li>
                                            <a href="{{ route('theme.newslooks.user.login') }}">
                                                <img src="{{ asset('themes/newslooks/public/') }}/img/icon/user.svg"
                                                    class="svg" alt="user">
                                            </a>
                                        </li>
        
                                        <li>
                                            <!-- Menu Trigger -->
                                            <button class="menu-trigger-btn" data-toggle="offCanvas"
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

                        <!-- Horizontal Menu -->
                        <div class="horizontal-menu active-style-none list-has-separator d-none d-lg-block">
                            @include('theme/newslooks::frontend.includes.headers.menu', [
                                'main_menuTree' => $main_menuTree,
                                'list' => 'nav justify-content-center',
                                'text_color' => 'text-dark'
                            ])
                        </div>
                        <!-- End Horizontal Menu -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Bottom -->
</header>
<!-- End Header -->


<!-- Breaking News In Bottom -->
@if (isset($headerOption['header_h5_breaking_position']) && $headerOption['header_h5_breaking_position'] == 'bottom')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h5'])
@endif
<!-- End Breaking News -->
