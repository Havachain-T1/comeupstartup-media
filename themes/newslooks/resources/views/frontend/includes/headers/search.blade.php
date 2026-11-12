<!-- Offcanvas -->
<div class="offcanvas" id="offcanvasBlog">
    <div class="offcanvas-panel h-100 w-100 bg-light right">
        <div class="offcanvas-panel-inner">
            <!-- Close Offcanvas -->
            <button class="close-offcanvas text-dark bg-transparent p-0 d-block ml-auto">
                <img class="svg" src="{{ asset('themes/newslooks/public/') }}/img/icon/close.svg" alt="close">
            </button>
            <!-- End Close Offcanvas -->

            <!-- Content -->
            <div class="offcanvas-content">
                <div class="h-80vh row align-items-center justify-content-center">
                    <!-- Search Form -->
                    <form action="#"class="header-search-form col-lg-8 col-md-10">
                        <div class="theme-input-group">
                            <input type="text" name="search" class="search-text"
                                placeholder="{{ front_translate('Search Keyword') }}…"
                                value="{{ Route::is('blog.blogBySearch') ? $text : '' }}">
                            <button type="button" class="search-btn">
                                <img class="svg" src="{{ asset('themes/newslooks/public/') }}/img/icon/search.svg"
                                    alt="search">
                            </button>
                        </div>
                    </form>
                    <!-- End Search Form -->
                </div>
            </div>
            <!-- End Content -->
        </div>
    </div>
</div>
<!-- End Offcanvas -->
