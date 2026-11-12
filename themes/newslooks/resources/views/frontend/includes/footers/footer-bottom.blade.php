<!-- Footer Bottom -->
<div class="footer-bottom py-25 bg-dark-two-o20" id="footer_2_bottom">
    <div class="container">
        <div class="d-flex flex-column flex-lg-row align-items-center justify-content-between">
            <span class="copyright-text">
                {!! xss_clean($copyright_text) !!}
            </span>
            <!-- Footer Menu -->
            <ul class="nav footer-nav c1-hover mt-10 mt-sm-0">
                @foreach ($footer_bottom_menuTree as $menu)
                    <li><a href="{{ $menu->preview_url }}">{{ $menu->title }}</a></li>
                @endforeach
            </ul>
        </div>
    </div>
</div>
<!-- End Footer Bottom -->
