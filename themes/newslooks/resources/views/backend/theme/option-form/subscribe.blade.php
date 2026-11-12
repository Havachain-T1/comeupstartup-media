<h3 class="black mb-3">{{ translate('Subscribe') }}</h3>
<input type="hidden" name="option_name" value="subscribe">

{{-- Mailchimp API Key Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4">
        <label for="mailchimp_api_key" class="font-16 bold black">{{ translate('Mailchimp API Key') }}
        </label>
        <span class="d-block">{{ translate('Set mailchimp api key') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="mailchimp_api_key" id="mailchimp_api_key" class="form-control"
            value="{{ isset($option_settings['mailchimp_api_key']) ? $option_settings['mailchimp_api_key'] : '' }}">
    </div>
</div>

{{-- Mailchimp List ID Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4">
        <label for="mailchimp_list_id" class="font-16 bold black">{{ translate('Mailchimp List ID') }}
        </label>
        <span class="d-block">{{ translate('Set mailchimp list id.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="mailchimp_list_id" id="mailchimp_list_id" class="form-control"
            value="{{ isset($option_settings['mailchimp_list_id']) ? $option_settings['mailchimp_list_id'] : '' }}">
    </div>
</div>

{{-- Custom Footer Subscribe Style Field Start --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Custom Sidebar Subscribe Style'),
    'sub_text' => translate('Set custom footer subscribe style'),
    'switch_name' => 'custom_footer_subscribe',
])

{{-- Custom Footer Subscribe Switch On Field Start --}}
<div id="custom_footer_subscribe_switch_on_field">

    {{-- Newsletter Background Image Field --}}
    <div id="custom_preloader_type_image">
        <div class="form-group row py-3 border-bottom">
            <div class="col-xl-4">
                <label for="newsletter_bg_image" class="font-16 bold black">{{ translate('Newsletter Background Image') }}
                </label>
            </div>
            <div class="col-xl-6 offset-xl-1">
                @include('core::base.includes.media.media_input', [
                    'input' => 'newsletter_bg_image',
                    'data' => isset($option_settings['newsletter_bg_image'])
                        ? $option_settings['newsletter_bg_image']
                        : null,
                ])
            </div>
        </div>
    </div>

    {{-- Newsletter Title Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Newsletter Title Color'),
        'color_name' => 'newsletter_title_color',
    ])

    {{-- Newsletter Subtitle Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Newsletter Subtitle Color'),
        'color_name' => 'newsletter_subtitle_color',
    ])

    {{-- Newsletter Button Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Newsletter Button Text Color'),
        'color_name' => 'newsletter_button_color',
    ])
</div>
