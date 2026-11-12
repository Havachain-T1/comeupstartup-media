<!-- Breaking News In Top -->
@if (isset($headerOption['header_h3_breaking_position']) && $headerOption['header_h3_breaking_position'] == 'top')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h3'])
@endif
<!-- End Breaking News -->

<!-- Header -->
<header class="header">

    <!-- Search -->
    @include('theme/newslooks::frontend.includes.headers.search')
    <!-- Search -->

    @if (isset($headerOption['header_top_h3']) && $headerOption['header_top_h3'] == 1)
        <!-- Header Top -->
        @include('theme/newslooks::frontend.includes.headers.header-top', ['variant' => 'h3'])
        <!-- Header Top -->
    @endif

    <!-- Header Middle -->
    <div class="py-30" id="header_middle_h3">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-4 text-center text-md-left">
                    <!-- Logo -->
                    <a class="logo" href="{{ route('home') }}">
                        <img src="{{ $logo }}" alt="logo">
                    </a>
                    <!-- End Logo -->
                </div>

                @if (isset($headerOption['header_middle_h3_ads_image']))
                    @php
                        $selected_ad = Core\Models\CustomAd::find($headerOption['header_middle_h3_ads_image']);
                    @endphp
                    <div class="col-md-8 d-none d-lg-block">
                        @if ($selected_ad != null && $selected_ad->isActive())
                            @php
                                $size_array = explode('x', $selected_ad->size);
                                $width = $size_array[0];
                                $height = $size_array[1];
                            @endphp
                            @if ($selected_ad->type == 'iframe')
                                <iframe src="{{ $selected_ad->content }}"
                                    style="width:{{ $width }}px; height:{{ $height }}px; border: none;"
                                    frameborder="0" class="ads-sense-ad ad-clicker" data-id="{{ $selected_ad->id }}"
                                    allowfullscreen>
                                </iframe>
                            @endif
                            @if ($selected_ad->type == 'image')
                                <a href="{{ $selected_ad->url }}" class="ads-sense-ad ad-clicker"
                                    data-id="{{ $selected_ad->id }}" target="_blank">
                                    <img data-src="{{ getFilePath($selected_ad->content) }}" alt="Ads"
                                        class="img-fluid lazy">
                                </a>
                            @endif

                            @if ($selected_ad->type == 'adsense')
                                <div class="ads-sense-ad ad-clicker" data-id="{{ $selected_ad->id }}">
                                    {!! $selected_ad->content !!}
                                </div>
                            @endif
                        @endif
                    </div>
                @endif
            </div>
        </div>
    </div>
    <!-- End Header Bottom -->

    <!-- Header Bottom -->
    <div class="header-top c1-bg py-15 py-lg-0" data-sticky="true" id="header_bottom_h3">
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
    <!-- End Header Bottom -->
</header>
<!-- End Header -->

<!-- Breaking News In Bottom -->
@if (isset($headerOption['header_h3_breaking_position']) && $headerOption['header_h3_breaking_position'] == 'bottom')
    @include('theme/newslooks::frontend.includes.headers.breaking-news', ['header' => 'h3'])
@endif
<!-- End Breaking News -->
