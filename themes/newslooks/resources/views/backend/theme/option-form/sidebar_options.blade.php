@php
    $fonts = getAllFonts();
@endphp
{{-- Sidebar Options Header --}}
<h3 class="black mb-3">{{ translate('Sidebar Options') }}</h3>
<input type="hidden" name="option_name" value="sidebar_options">

{{-- Blog sidebar Switch Start --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Custom Sidebar Style'),
    'switch_name' => 'custom_sidebar',
])

{{-- Custom Sidebar Style Switch On Field Start --}}
<div id="custom_sidebar_switch_on_field">

    {{-- Widgets Background Color Field Start --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Widgets Background Color'),
        'color_name' => 'widget_background_color',
    ])

    {{-- Widgets Custom Margin Field Start --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-3">
            <label class="font-16 bold black">{{ translate('Widget Margin') }}
            </label>
        </div>
        <div class="col-xl-8 offset-xl-1 row">
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-up"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_margin_top" id="widget_margin_top"
                    value="{{ isset($option_settings['widget_margin_top']) ? $option_settings['widget_margin_top'] : '' }}"
                    placeholder="{{ translate('Top') }}">
            </div>
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-right"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_margin_right" id="widget_margin_right"
                    value="{{ isset($option_settings['widget_margin_right']) ? $option_settings['widget_margin_right'] : '' }}"
                    placeholder="{{ translate('Right') }}">
            </div>
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-down"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_margin_bottom" id="widget_margin_bottom"
                    value="{{ isset($option_settings['widget_margin_bottom']) ? $option_settings['widget_margin_bottom'] : '' }}"
                    placeholder="{{ translate('Bottom') }}">
            </div>
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-left"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_margin_left" id="widget_margin_left"
                    value="{{ isset($option_settings['widget_margin_left']) ? $option_settings['widget_margin_left'] : '' }}"
                    placeholder="{{ translate('Left') }}">
            </div>
            <div class="input-group col-xl-3 mt-2">
                <select class="form-control select" name="widget_margin_unit" id="widget_margin_unit">
                    <option value="px"
                        {{ isset($option_settings['widget_margin_unit']) && $option_settings['widget_margin_unit'] == 'px' ? 'selected' : '' }}>
                        px</option>
                    <option value="em"
                        {{ isset($option_settings['widget_margin_unit']) && $option_settings['widget_margin_unit'] == 'em' ? 'selected' : '' }}>
                        em</option>
                </select>
            </div>
        </div>
    </div>

    {{-- Widgets Custom Padding Field Start --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-3">
            <label class="font-16 bold black">{{ translate('Widget Padding') }}
            </label>
        </div>
        <div class="col-xl-8 offset-xl-1 row">
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-up"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_padding_top" id="widget_padding_top"
                    value="{{ isset($option_settings['widget_padding_top']) ? $option_settings['widget_padding_top'] : '' }}"
                    placeholder="{{ translate('Top') }}">
            </div>
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-right"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_padding_right" id="widget_padding_right"
                    value="{{ isset($option_settings['widget_padding_right']) ? $option_settings['widget_padding_right'] : '' }}"
                    placeholder="{{ translate('Right') }}">
            </div>
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-down"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_padding_bottom" id="widget_padding_bottom"
                    value="{{ isset($option_settings['widget_padding_bottom']) ? $option_settings['widget_padding_bottom'] : '' }}"
                    placeholder="{{ translate('Bottom') }}">
            </div>
            <div class="input-group col-xl-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="icofont-arrow-left"></i>
                    </div>
                </div>
                <input type="number" class="form-control" name="widget_padding_left" id="widget_padding_left"
                    value="{{ isset($option_settings['widget_padding_left']) ? $option_settings['widget_padding_left'] : '' }}"
                    placeholder="{{ translate('Left') }}">
            </div>
            <div class="input-group col-xl-3 mt-2">
                <select class="form-control select" name="widget_padding_unit" id="widget_padding_unit">
                    <option value="px"
                        {{ isset($option_settings['widget_padding_unit']) && $option_settings['widget_padding_unit'] == 'px' ? 'selected' : '' }}>
                        px</option>
                    <option value="em"
                        {{ isset($option_settings['widget_padding_unit']) && $option_settings['widget_padding_unit'] == 'em' ? 'selected' : '' }}>
                        em</option>
                </select>
            </div>
        </div>
    </div>

    {{-- Widget Title Color Field Start --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Widget Title Color'),
        'color_name' => 'widget_title_color',
    ])

    {{-- Widget Title Style 1 After Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Widget Title After Color'),
        'color_name' => 'widget_title_after_color',
    ])
</div>
