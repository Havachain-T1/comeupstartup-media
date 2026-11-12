<!-- Breaking News In Top -->
@if (isset($headerOption['header_h4_breaking_position']) && $headerOption['header_h4_breaking_position'] == 'top')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h4'])
@endif
<!-- End Breaking News -->

<!-- Header -->
<header class="header">

    <!-- Search -->
    @include('theme/newslooks::frontend.includes.headers.search')
    <!-- Search -->

    @if (isset($headerOption['header_top_h4']) && $headerOption['header_top_h4'] == 1)
        <!-- Header Top -->
        @include('theme/newslooks::frontend.includes.headers.header-top', ['variant' => 'h4'])
        <!-- Header Top -->
    @endif

    <!-- Header Bottom -->
    <div class="header-bottom c1" id="header_bottom_h4">
        <div class="container">
            <div class="py-10">
                <div class="row d-lg-none align-items-center justify-content-between">
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

                <div class="row position-relative align-items-center justify-content-between d-none d-lg-flex">
                    <div class="col-2">
                        <!-- Logo -->
                        <a class="logo" href="{{ route('home') }}">
                            <img src="{{ $logo }}" alt="logo">
                        </a>
                        <!-- End Logo -->
                    </div>
                    <div class="col-8 position-static">
                        <!-- Horizontal Menu -->
                        <div class="horizontal-menu gap-sm d-none d-lg-block">
                            @include('theme/newslooks::frontend.includes.headers.menu', [
                                'main_menuTree' => $main_menuTree,
                                'list' => 'nav',
                                'text_color' => 'text-dark'
                            ])
                        </div>
                        <!-- End Horizontal Menu -->
                    </div>
                    <div class="col-auto">
                        <!-- Header Right -->
                        <div class="header-right-menu list-has-separator">
                            <ul class="nav align-items-center">
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
    </div>
    <!-- End Header Bottom -->


</header>
<!-- End Header -->

<!-- Breaking News In Bottom -->
@if (isset($headerOption['header_h4_breaking_position']) && $headerOption['header_h4_breaking_position'] == 'bottom')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h4'])
@endif
<!-- End Breaking News -->
