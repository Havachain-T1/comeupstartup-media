<!-- ======= jQuery Library ======= -->
<script src=" {{ asset('themes/newslooks/public/') }}/js/jquery.min.js"></script>

<!-- ======= Poper Library ======= -->
<script src=" {{ asset('themes/newslooks/public/') }}/js/poper.min.js" defer></script>

<script src="{{ asset('themes/newslooks/public/') }}/js/bootstrap.min.js"></script>

<!-- ======= Marquee ======= -->
<script src="{{ asset('themes/newslooks/public/') }}/plugins/marquee/jquery.marquee.min.js"></script>

<!-- ======= Swiper Slider ======= -->
<script src="{{ asset('themes/newslooks/public/') }}/plugins/swiper/swiper-bundle.min.js"></script>

<!-- ======= Simplebar ======= -->
<script src="{{ asset('themes/newslooks/public/') }}/plugins/simplebar/simplebar.min.js" defer></script>

<!-- ======= Magnific Popop ======= -->
<script src="{{ asset('themes/newslooks/public/') }}/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

{{-- Cookies Js --}}
<script src="{{ asset('/public/backend/assets/plugins/js-cookie/js.cookie.min.js') }}"></script>

<!-- Lazy Load -->
<script type="text/javascript" src="{{ asset('themes/newslooks/public/') }}/plugins/jquery-lazy/jquery.lazy.min.js">
</script>

<!-- ======= Main JS ======= -->
<script src="{{ asset('themes/newslooks/public/') }}/js/main.js"></script>

<!-- ======= Custom JS ======= -->
<script src="{{ asset('themes/newslooks/public/') }}/js/custom.js"></script>

<!-- ======= TOASTER ======= -->
<script src="{{ asset('/public/backend/assets/js/toaster.min.js') }}"></script>
{!! Toastr::message() !!}
<!-- ======= TOASTER ======= -->

<script>
    (function($) {
        'use strict'

        $('.lazy').Lazy({
            visibleOnly: true
        });

        // Check If Popup Cookie Is Availble Then Remove popup Modal
        if (Cookies.get('acceptCookies')) {
            $('.gdpr-box').addClass('d-none');
        };

        // Check If Website Popup Is Availble Then Remove GDPR Box
        if (Cookies.get('website_popup')) {
            $('#popupModal').addClass('d-none');
        } else {
            $('#popupModal').modal('show');
        }

        // Blog Search Form
        $(document).on('submit', '.header-search-form', function(e) {
            e.preventDefault();
            let text = $(this).find('.search-text').val();
            if (text.length > 0) {
                submitSearch(text);
            }
        });

        // Onclick Search Icon
        $(document).on('click', '.search-btn', function(e) {
            e.preventDefault();
            let text = $(this).prev().val();
            if (text.length > 0) {
                submitSearch(text);
            }
        });

        // Cookie Consent Hide
        $(document).on('click', '.accept-cookie', function() {
            // Cookies expired on 1 day
            Cookies.set('acceptCookies', 1, {
                expires: 1,
                path: '{{ env('APP_URL') }}'
            });
            $('.gdpr-box').addClass('d-none');
        });

        // Cookie Consent Hide
        $(document).on('click', '.modal-close', function() {
            // Cookies expired on 1 day
            Cookies.set('website_popup', 1, {
                expires: 0.5,
                path: '{{ env('APP_URL') }}'
            });
            $('#popupModal').addClass('d-none');
        });

        // Search Submit
        function submitSearch(text) {
            let url = '{{ route('theme.newslooks.blog.blogBySearch', 'searchText') }}';
            url = url.replace("searchText", encodeURIComponent(text.replace(/\//g, ' ').trim()));
            window.location.href = url;
        }

        // Reading List Action
        $(document).on('click', '#reading-list-action', function() {
            let blog_id = $(this).data('blog');
            let user_id = $(this).data('user');
            let url = "{{ route('theme.newslooks.user.update.readingList') }}";
            let elemnt = $(this);

            $.ajax({
                type: "post",
                url: url,
                data: {
                    blog_id: blog_id,
                    user_id: user_id
                },
                success: function(response) {
                    toastr.success(response.message);

                    if (response.bookmarked) {
                        elemnt.addClass('c1').attr('title',
                            "{{ front_translate('Remove From Reading List') }}");
                    } else {
                        elemnt.removeClass('c1').attr('title',
                            "{{ front_translate('Add To Reading List') }}");
                    }

                },
                error: function(response) {
                    toastr.error(response.responseJSON.message);
                },
            });

        });

    })(jQuery);
</script>
<script src="https://vjs.zencdn.net/8.0.4/video.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/videojs-youtube/dist/Youtube.min.js"></script>
<script>
    window.CUS_SEARCH = {
        endpoint: @json(route('search.suggest')),
        minChars: {{ (int) config('search.min_query_length', 2) }},
        debounce: 300,
        labels: {
            loading: @json(front_translate('Searching') . '…'),
            empty: @json(front_translate('No results for')),
            results: @json(front_translate('suggestions')),
            viewAll: @json(front_translate('See all results for')),
            articles: @json(front_translate('Articles')),
            categories: @json(front_translate('Categories')),
            authors: @json(front_translate('Authors')),
            clear: @json(front_translate('Clear search')),
            error: @json(front_translate('Search is unavailable right now. Press Enter to search.')),
            offline: @json(front_translate('You appear to be offline.')),
            rateLimited: @json(front_translate('Too many searches, please wait a moment.'))
        }
    };
</script>
<script src="{{ asset('public/js/search/live-search.js') }}" defer></script>
<script src="{{ asset('public/js/ux/a11y-nav.js') }}" defer></script>
@yield('custom-scripts')
