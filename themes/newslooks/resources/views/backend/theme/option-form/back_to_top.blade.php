<h3 class="black mb-3">{{ translate('Back To Top') }}</h3>
<input type="hidden" name="option_name" value="back_to_top">

{{-- Back To Top Button Switch --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Back To Top Button'),
    'sub_text' => translate('Switch On to Display back to top button.'),
    'switch_name' => 'back_to_top_button',
])

{{-- Back To Top Button Switch On Field --}}
<div id="back_to_top_button_switch_on_field">

    {{-- Default Or Custom Back To Top Button Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Custom Back To Top Button'),
        'sub_text' => translate('If you switch it off, it will show default design for "back to top" button.'),
        'switch_name' => 'custom_back_to_top_button',
    ])

    {{-- Custom Back To Top Styles Field --}}
    <div id="custom_back_to_top_button_switch_on_field">

        {{-- Custom Back To Top Button Icon Picker --}}
        <div class="form-group row py-3 border-bottom">
            <div class="col-xl-4">
                <label for="custom_back_to_top_button_icon"
                    class="font-16 bold black">{{ translate('Custom Back To Top Button Icon') }}
                </label>
                <span class="d-block">{{ translate('Select Back To Top Button icon.') }}</span>
            </div>
            <div class="col-xl-6 offset-xl-1">
                <input class="form-control icon-picker" name="custom_back_to_top_button_icon"
                    value="{{ isset($option_settings['custom_back_to_top_button_icon']) ? $option_settings['custom_back_to_top_button_icon'] : '' }}"
                    type="text" />
            </div>
        </div>

        {{-- Back To Top Button Background Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Back To Top Button Background Color'),
            'color_name' => 'back_to_top_button_bgcolor',
        ])

        {{-- Back To Top Button Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Back To Top Button Color'),
            'color_name' => 'back_to_top_button_color',
        ])

        {{-- Back To Top Button On Mobile Switch --}}
        @include('theme/newslooks::backend.theme.components.switch', [
            'text' => translate('Keep Back To Top Button On Mobile'),
            'sub_text' => translate('If you switch it on, it will show in mobile devices.'),
            'switch_name' => 'back_to_top_button_on_mobile',
        ])
    </div>

</div>
