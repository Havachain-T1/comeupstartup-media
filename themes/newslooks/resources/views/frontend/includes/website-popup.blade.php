@php
    $website_popup = getThemeOption('website_popup', $active_theme->id);
@endphp

@if (isset($website_popup['website_popup_status']) && $website_popup['website_popup_status'] == 1)
    <!-- Modal -->
    <div class="modal fade" role="dialog" id="popupModal" tabindex="-1"  aria-label="popupModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content position-relative p-0">
                <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="modal-body p-0">
                    <div class="content mb-30">
                        {!! isset($website_popup['website_popup_content']) ? $website_popup['website_popup_content'] : '' !!}
                    </div>
                    @if (isset($website_popup['website_popup_subscribe_status']) && $website_popup['website_popup_subscribe_status'] == 1)
                        <div class="newsletter px-50 mb-40">
                            <form action="">
                                <input class="theme-input-style mb-20" type="email"
                                    placeholder="{{ front_translate('Enter Email Address') }}">
                                <button class="btn w-100 d-block mt-2">{{ front_translate('Submit Now') }}</button>
                            </form>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endif
