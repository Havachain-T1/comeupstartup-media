<h3 class="black mb-3">{{ translate('Website Popup') }}</h3>
<input type="hidden" name="option_name" value="website_popup">


{{-- Enable Website Popup Switch --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Enable Website Popup'),
    'switch_name' => 'website_popup_status',
])

{{-- Popup Content Field --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4 mb-3">
        <label for="website_popup_content" class="font-16 bold black">{{ translate('Popup content') }}
        </label>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <textarea class="form-control text-editor" name="website_popup_content" id="website_popup_content"> {{ isset($option_settings['website_popup_content']) ? $option_settings['website_popup_content'] : '' }}</textarea>
    </div>
</div>

{{-- Show Subscriber form? Switch --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Show Subscriber form?'),
    'switch_name' => 'website_popup_subscribe_status',
])

