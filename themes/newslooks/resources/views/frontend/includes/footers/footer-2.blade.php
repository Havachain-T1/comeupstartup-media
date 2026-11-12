@php
    $footer_2_menu = getMenuStructureByGroupId($footerOption['footer_2_bottom_menu']);
    $footer_2_menuTree = buildMenuTree($footer_2_menu);
@endphp

<footer class="footer bg-dark">

    <!-- Footer Middle -->
    <div class="footer-top" id="footer_2_middle">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <!-- Footer Description -->
                    <div class="footer-description text-center mx-auto">
                        <a class="logo" href="{{ route('home') }}">
                            <img src="{{ $logo }}" alt="logo">
                        </a>
                        <p class="mt-30">
                            {{ isset($footerOption['footer_2_middle_text']) ? $footerOption['footer_2_middle_text'] : '' }}
                        </p>
                    </div>
                    <!-- End Footer Description -->

                    <!-- Widget Socials -->
                    <div class="widget widget-socials with-border circle-style w-45 d-flex align-items-center justify-content-center">
                        @include('theme/newslooks::frontend.includes.socials.social')
                    </div>
                    <!-- Widget Socials -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Middle -->

    <!-- Footer Bottom Menu -->
    @includeIf('theme/newslooks::frontend.includes.footers.footer-bottom', ['footer_bottom_menuTree' => $footer_2_menuTree])
</footer>
