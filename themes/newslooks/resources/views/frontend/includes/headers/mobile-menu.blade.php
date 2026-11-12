<!-- Offcanvas Menu -->
<div class="offcanvas d-lg-none" id="offcanvasMenu">
    <div class="offcanvas-panel w-100 h-100 bg-white p-0">
        <div class="offcanvas-header p-30 d-flex align-items-center justify-content-between">
            <!-- Logo -->
            <a href="{{ route('home') }}">
                <img src="{{ $logo }}" alt="logo">
            </a>
            <!-- End Logo -->

            <!-- Close Offcanvas -->
            <button class="close-offcanvas text-title bg-transparent p-0">
                <img class="svg" src="{{ asset('themes/newslooks/public/') }}/img/icon/close.svg" alt="close">
            </button>
            <!-- End Close Offcanvas -->
        </div>
        <div class="offcanvas-content bg-white py-30">
            <!-- Mobile Menu -->
            <div class="vertical-menu">
                    @include('theme/newslooks::frontend.includes.headers.menu', [
                        'main_menuTree' => $main_menuTree,
                        'list' => 'nav',
                        'column' => 'flex-column',
                        'text_color' => ''
                    ])
            </div>
            <!-- Mobile Menu -->
        </div>
        <div class="offcanvas-social">
            <!-- Widget socials -->
            <div class="widget widget-socials with-border d-flex justify-content-center">
                @include('theme/newslooks::frontend.includes.socials.social')
            </div>
            <!-- Widget socials -->
        </div>
    </div>
</div>
<!-- End Offcanvas Menu -->

<!-- Offcanvas Trigger -->
<button class="trigger-button d-lg-none {{ $text_color }}" data-toggle="offCanvas" data-target="offcanvasMenu" aria-label="mobile-menu">
    <span></span>
    <span></span>
    <span></span>
</button>
<!-- End Offcanvas Trigger -->
