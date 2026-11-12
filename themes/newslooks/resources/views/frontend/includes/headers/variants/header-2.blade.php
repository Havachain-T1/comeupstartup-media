<!-- Breaking News In Top -->
@if (
    $headerOption['header_h2_breaking'] == 1 &&
        isset($headerOption['header_h2_breaking_position']) &&
        $headerOption['header_h2_breaking_position'] == 'top')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h2'])
@endif
<!-- End Breaking News -->

<!-- Header -->
<header class="header">

    <!-- Search -->
    @include('theme/newslooks::frontend.includes.headers.search')
    <!-- Search -->

    @if (isset($headerOption['header_top_h2']) && $headerOption['header_top_h2'] == 1)
        <!-- Header Top -->
        @include('theme/newslooks::frontend.includes.headers.header-top', ['variant' => 'h2'])
        <!-- Header Top -->
    @endif

    <!-- Header Middle -->
    <div class="header-top c1-bg py-15 py-lg-0" data-sticky="true" id="header_middle_h2">
        <div class="container">
            <div class="row align-items-center justify-content-between position-relative">
                <div class="col-auto position-static">
                    <div class="d-flex align-items-center">
                        @include('theme/newslooks::frontend.includes.headers.mobile-menu', [
                            'main_menuTree' => $main_menuTree,
                            'text_color' => 'text-white',
                        ])
                    </div>

                    <!-- Horizontal Menu -->
                    <div class="horizontal-menu list-has-separator d-none d-lg-block">
                        @include('theme/newslooks::frontend.includes.headers.menu', [
                            'main_menuTree' => $main_menuTree,
                            'list' => 'nav',
                            'text_color' => 'text-white',
                        ])
                    </div>
                    <!-- End Horizontal Menu -->
                </div>

                <div class="col-auto">
                    <!-- Header Right -->
                    <div class="header-right-menu list-has-separator">
                        <ul class="nav align-items-center">
                            <li>
                                <a href="{{ route('theme.newslooks.user.login') }}" class="text-white"
                                    aria-label="User-Account">
                                    <img src="{{ asset('themes/newslooks/public/') }}/img/icon/user.svg" class="svg"
                                        alt="user">
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
    <div class="py-30" id="header_bottom_h2">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-4 text-center text-md-left">
                    <!-- Logo -->
                    <a class="logo" href="{{ route('home') }}">
                        <img src="{{ $logo }}" alt="logo">
                    </a>
                    <!-- End Logo -->
                </div>

                @if (isset($headerOption['header_bottom_h2_ads_image']))
                    @php
                        $header_2_ad = Core\Models\CustomAd::find($headerOption['header_bottom_h2_ads_image']);
                    @endphp
                    <div class="col-md-8 d-none d-lg-block">
                        @if ($header_2_ad != null && $header_2_ad->isActive())
                            @php
                                $size_array = explode('x', $header_2_ad->size);
                                $width = $size_array[0];
                                $height = $size_array[1];
                            @endphp
                            @if ($header_2_ad->type == 'iframe')
                                <iframe src="{{ $header_2_ad->content }}"
                                    style="width:{{ $width }}px; height:{{ $height }}px; border: none;"
                                    frameborder="0" class="ads-sense-ad ad-clicker" data-id="{{ $header_2_ad->id }}"
                                    allowfullscreen>
                                </iframe>
                            @endif
                            @if ($header_2_ad->type == 'image')
                                <a href="{{ $header_2_ad->url }}" class="ads-sense-ad ad-clicker"
                                    data-id="{{ $header_2_ad->id }}" target="_blank">
                                    <img data-src="{{ getFilePath($header_2_ad->content) }}" alt="Ads"
                                        class="img-fluid lazy">
                                </a>
                            @endif

                            @if ($header_2_ad->type == 'adsense')
                                <div class="ads-sense-ad ad-clicker" data-id="{{ $header_2_ad->id }}">
                                    {!! $header_2_ad->content !!}
                                </div>
                            @endif
                        @endif
                    </div>
                @endif
            </div>
        </div>
    </div>
    <!-- End Header Bottom -->
</header>
<!-- End Header -->

<!-- Breaking News In Bottom -->
@if (
    $headerOption['header_h2_breaking'] == 1 &&
        isset($headerOption['header_h2_breaking_position']) &&
        $headerOption['header_h2_breaking_position'] == 'bottom')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h2'])
@endif
<!-- End Breaking News -->
