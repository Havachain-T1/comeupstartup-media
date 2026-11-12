<h3 class="black mb-3">{{ translate('Preloader') }}</h3>
<input type="hidden" name="option_name" value="preloader">

{{-- Preloader Enable/Disable Switch Field --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Preloader'),
    'sub_text' => translate('Switch Enabled to Display Preloader.'),
    'switch_name' => 'preloader_field',
])

{{-- Preloader Switch On Field Start --}}
<div id="preloader_field_switch_on_field">
    {{-- Preloader Default-Custom Switch Field --}}
    <div class="form-group row py-3 border-bottom">
        <div class="col-xl-4">
            <label class="font-16 bold black">{{ translate('Preloader Style Type') }}
            </label>
            <span
                class="d-block">{{ translate('Control preloader style type. If you use this option then you will able to set lot of preloader style') }}</span>
        </div>
        <div class="col-xl-6 offset-xl-1">
            <label class="switch success">
                <input type="hidden" name="preloader_style_type" value="default">
                <input type="checkbox"
                    {{ isset($option_settings['preloader_style_type']) && $option_settings['preloader_style_type'] == 'custom' ? 'checked' : 'default' }}
                    name="preloader_style_type" id="preloader_style_type" value="custom">
                <span class="control" id="preloader_style_type_switch">
                    <span class="switch-off">{{ translate('Default') }}</span>
                    <span class="switch-on">{{ translate('Custom') }}</span>
                </span>
            </label>
        </div>
    </div>

    {{-- Preloader Custom Field Start --}}
    <div id="preloader_style_type_switch_on_field">
        {{-- Custom Preloader Type Image or Text Field --}}
        <div class="form-group row py-3 border-bottom">
            <div class="col-xl-4">
                <label class="font-16 bold black">{{ translate('Custom Preloader Type') }}
                </label>
                <b class="d-block">{{ translate('Image Type - Text Type') }}</b>
                <span class="d-block">{{ translate('Set Custom Preloader Type.') }}</span>
            </div>
            <div class="col-xl-6 offset-xl-1">
                <label class="switch primary">
                    <input type="hidden" name="custom_preloader_type" value="image">
                    <input type="checkbox"
                        {{ isset($option_settings['custom_preloader_type']) && $option_settings['custom_preloader_type'] == 'text' ? 'checked' : 'image' }}
                        name="custom_preloader_type" id="custom_preloader_type" value="text">
                    <span class="control" id="custom_preloader_type_switch">
                        <span class="switch-off">Image</span>
                        <span class="switch-on">Text</span>
                    </span>
                </label>
            </div>
        </div>

        {{-- Custom Preloader Type Image Field --}}
        <div id="custom_preloader_type_image">
            <div class="form-group row py-3 border-bottom">
                <div class="col-xl-4">
                    <label for="preloader_image" class="font-16 bold black">{{ translate('Preloader Image') }}
                    </label>
                    <span class="d-block">{{ translate('Set Preloader Image.') }}</span>
                </div>
                <div class="col-xl-6 offset-xl-1">
                    @include('core::base.includes.media.media_input', [
                        'input' => 'preloader_image',
                        'data' => isset($option_settings['preloader_image'])
                            ? $option_settings['preloader_image']
                            : null,
                    ])
                </div>
            </div>
        </div>

        {{-- Custom Preloader Type Text Field --}}
        <div id="custom_preloader_type_text">
            {{-- Custom Preloader Type Text Heading Tag Field --}}
            <input type="hidden" name="preloader_html" id="preloader_html"
                value="{{ isset($option_settings['preloader_html']) ? $option_settings['preloader_html'] : '' }}">
            <div class="form-group row py-3 border-bottom">
                <div class="col-xl-4">
                    <label for="preloader_heading_tag"
                        class="font-16 bold black">{{ translate('Preloader Heading Tag') }}
                    </label>
                    <span class="d-block">{{ translate('Set Preloader Heading Tag.') }}</span>
                </div>
                <div class="col-xl-6 offset-xl-1">
                    <select name="preloader_heading_tag" id="preloader_heading_tag" class="form-control select"
                        onchange="preloaderHtml()">
                        <option value="h1"
                            {{ isset($option_settings['preloader_heading_tag']) && $option_settings['preloader_heading_tag'] == 'h1' ? 'selected' : '' }}>
                            H1</option>
                        <option value="h2"
                            {{ isset($option_settings['preloader_heading_tag']) && $option_settings['preloader_heading_tag'] == 'h2' ? 'selected' : '' }}>
                            H2</option>
                        <option value="h3"
                            {{ isset($option_settings['preloader_heading_tag']) && $option_settings['preloader_heading_tag'] == 'h3' ? 'selected' : '' }}>
                            H3</option>
                        <option value="h4"
                            {{ isset($option_settings['preloader_heading_tag']) && $option_settings['preloader_heading_tag'] == 'h4' ? 'selected' : '' }}>
                            H4</option>
                        <option value="h5"
                            {{ isset($option_settings['preloader_heading_tag']) && $option_settings['preloader_heading_tag'] == 'h5' ? 'selected' : '' }}>
                            H5</option>
                        <option value="h6"
                            {{ isset($option_settings['preloader_heading_tag']) && $option_settings['preloader_heading_tag'] == 'h6' ? 'selected' : '' }}>
                            H6</option>
                    </select>
                </div>
            </div>

            {{-- Custom Preloader Type Text (Text) Field --}}
            <div class="form-group row py-3 border-bottom">
                <div class="col-xl-4">
                    <label for="preloader_text" class="font-16 bold black">{{ translate('Preloader Text') }}
                    </label>
                    <span class="d-block">{{ translate('Set Preloader Text.') }}</span>
                </div>
                <div class="col-xl-6 offset-xl-1">
                    <input type="text" name="preloader_text" id="preloader_text" class="form-control"
                        value="{{ isset($option_settings['preloader_text']) ? $option_settings['preloader_text'] : '' }}"
                        onkeyup="preloaderHtml()">
                    <small>{{ translate('Transalate to another language') }} <a
                            href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
                </div>
            </div>
        </div>
    </div>

    {{-- Preloader Item Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Preloader Item Color'),
        'color_name' => 'preloader_item_color',
    ])

    {{-- Preloader Item Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Preloader Background Color'),
        'color_name' => 'preloader_bgcolor',
    ])

</div>
