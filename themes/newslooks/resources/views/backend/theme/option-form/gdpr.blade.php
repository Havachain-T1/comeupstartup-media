<h3 class="black mb-3">{{ translate('GDPR (Cookies Consent)') }}</h3>
<input type="hidden" name="option_name" value="gdpr">

{{-- GDPR Switch --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Enable Cookie Consent'),
    'switch_name' => 'gdpr_status',
])

{{-- GDPR Button Text --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4 mb-3">
        <label for="gdpr_btn_label" class="font-16 bold black">{{ translate('Button Label') }}
        </label>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" class="form-control" name="gdpr_btn_label" id="gdpr_btn_label"
            value="{{ isset($option_settings['gdpr_btn_label']) ? $option_settings['gdpr_btn_label'] : '' }}"
            placeholder="{{ translate('Enter button Label') }}">
    </div>
</div>

{{-- GDPR Message --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4 mb-3">
        <label for="gdpr_message" class="font-16 bold black">{{ translate('Message') }}
        </label>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <textarea class="form-control text-editor" name="gdpr_message" id="gdpr_message"> {{ isset($option_settings['gdpr_message']) ? $option_settings['gdpr_message'] : '' }}</textarea>
    </div>
</div>

{{-- GDPR Position --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4 mb-3">
        <label for="gdpr_position_class" class="font-16 bold black">{{ translate('Position') }}
        </label>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <select class="form-control" name="gdpr_position_class" id="gdpr_position_class">
            <option value="right" @selected(isset($option_settings['gdpr_position_class']) && $option_settings['gdpr_position_class'] == 'right')>Bottom Right</option>
            <option value="left" @selected(isset($option_settings['gdpr_position_class']) && $option_settings['gdpr_position_class'] == 'left')>Bottom Left</option>
        </select>
    </div>
</div>

{{-- GDPR Background Color Field --}}
@include('theme/newslooks::backend.theme.components.color', [
    'text' => translate('Background Color'),
    'color_name' => 'gdpr_bg_color',
])
