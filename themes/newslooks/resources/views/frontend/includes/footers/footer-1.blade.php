@php
    $footer_1_menu = getMenuStructureByGroupId($footerOption['footer_1_bottom_menu']);
    $footer_1_menuTree = buildMenuTree($footer_1_menu);

    $newsletter = isset($footerOption['footer_1_newsletter']) && $footerOption['footer_1_newsletter'] == 1 ? true: false;

    $sidebar_id = getThemeSidebarId('footer_variation_1_sidebar');
    $all_sidebar_widgets = getAllSidebarWidgetValuesFrontend($sidebar_id);
@endphp

<footer class="footer bg-dark">

    @if ($newsletter && isset($footerOption['footer_1_newsletter_position']) && $footerOption['footer_1_newsletter_position'] == 'top')
        <!-- Footer Newsletter -->
        <div class="footer-middle border-bottom pt-40 pb-40" id="footer_1_newsletter">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-sm-6 text-center text-sm-left">
                        <!-- Logo -->
                        <a class="logo" href="{{ route('home') }}">
                            <img src="{{ $logo }}" alt="logo">
                        </a>
                        <!-- End Logo -->
                    </div>

                    <div class="col-lg-6 order-last">
                        <form class="newsletter-form mx-lg-auto mt-20 mt-lg-0"  action="{{ route('theme.newslooks.newsletter.store') }}" method="POST">
                            @csrf
                            <div class="theme-input-group style--two">
                                <input type="email" name="email" placeholder="{{ front_translate('Enter Your Email') }}…">
                                <button class="c2-bg" type="submit">{{ front_translate('Subscribe') }}</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-lg-3 col-sm-6 order-lg-last">
                        <!-- Widget Socials -->
                        <div
                            class="widget widget-socials c2-hover-bg circle-style d-flex align-items-center justify-content-center justify-content-sm-end mb-0 mt-20 mt-sm-0">
                            @include('theme/newslooks::frontend.includes.socials.social')
                        </div>
                        <!-- Widget Socials -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Newsletter -->
    @endif

    <!-- Footer Sidebar -->
    <div class="footer-top pb-30 pt-60" id="footer_1_widget">
        <div class="container">
            <div class="row">
                @foreach ($all_sidebar_widgets as $widget)
                    @php
                        $name = strtolower(str_replace(' ', '_', $widget['widget_name']));
                    @endphp

                    <div class="col-lg-4 col-md-6">
                        @includeIf('theme/newslooks::frontend.widgets.' . $name, [
                            'value' => $widget['widget_value'],
                        ])
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    <!-- End Footer Sidebar -->

    @if ($newsletter && isset($footerOption['footer_1_newsletter_position']) && $footerOption['footer_1_newsletter_position'] == 'bottom')
        <!-- Footer Newsletter -->
        <div class="footer-middle border-top pt-40 pb-40" id="footer_1_newsletter">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-sm-6">
                        <!-- Logo -->
                        <a class="logo" href="{{ route('home') }}">
                            <img src="{{ $logo }}" alt="logo">
                        </a>
                        <!-- End Logo -->
                    </div>

                    <div class="col-lg-6 order-last">
                        <form action="" class="newsletter-form mx-lg-auto mt-20 mt-lg-0">
                            <div class="theme-input-group style--two">
                                <input type="text" placeholder="{{ front_translate('Enter Your Email') }}…">
                                <button class="c2-bg" type="submit">{{ front_translate('Subscribe') }}</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-lg-3 col-sm-6 order-lg-last">
                        <!-- Widget Socials -->
                        <div
                            class="widget widget-socials c2-hover-bg circle-style d-flex align-items-center justify-content-sm-end mb-0 mt-20 mt-sm-0">
                            @include('theme/newslooks::frontend.includes.socials.social')
                        </div>
                        <!-- Widget Socials -->
                    </div>
                </div>
            </div>
        </div>
    @endif

    <!-- Footer Bottom Menu -->
    @includeIf('theme/newslooks::frontend.includes.footers.footer-bottom', ['footer_bottom_menuTree' => $footer_1_menuTree])
</footer>
