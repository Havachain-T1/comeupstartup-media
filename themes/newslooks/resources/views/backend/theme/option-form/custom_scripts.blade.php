<h3 class="black mb-3">{{ translate('Custom Scripts') }}</h3>
<input type="hidden" name="option_name" value="custom_scripts">

<div class="form-group row py-4 border-bottom">
    <div class="col-xl-3 mb-3">
        <label class="font-16 bold black">{{ translate('Header Custom Script') }}
        </label>
    </div>
    <div class="col-xl-9">
        <textarea class="theme-input-style" name="header_custom_js_code" id="header_custom_js_code">{{ isset($option_settings['header_custom_js_code']) ? $option_settings['header_custom_js_code'] : '' }}</textarea>
        <small>{{ translate('Write script with <script> tag') }}</small>
    </div>
</div>

<div class="form-group row py-4 border-bottom">
    <div class="col-xl-3 mb-3">
        <label class="font-16 bold black">{{ translate('Footer Custom Script') }}
        </label>
    </div>
    <div class="col-xl-9">
        <textarea class="theme-input-style" name="footer_custom_js_code" id="footer_custom_js_code">{{ isset($option_settings['footer_custom_js_code']) ? $option_settings['footer_custom_js_code'] : '' }}</textarea>
        <small>{{ translate('Write script with <script> tag') }}</small>
    </div>
</div>
