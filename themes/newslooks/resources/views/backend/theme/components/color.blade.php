<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4">
        <label class="font-16 bold black">{{ $text }}
        </label>
        @if (isset($sub_text))
            <span class="d-block">{{ $sub_text }}</span>
        @endif
    </div>
    <div class="col-xl-6 offset-xl-1">
        <div class="row ml-2">
            <div class="color">
                <input type="text" class="form-control" name="{{ $color_name }}"
                    value="{{ isset($option_settings[$color_name]) ? $option_settings[$color_name] : '' }}">

                <input type="color" class="" id="{{ $color_name }}"
                    value="{{ isset($option_settings[$color_name]) ? $option_settings[$color_name] : '#fafafa' }}">

                <label for="{{ $color_name }}">{{ translate('Select Color') }}</label>
            </div>
            <div class="d-flex align-items-center">
                <label class="custom-checkbox position-relative ml-2 mr-1">
                    <input type="hidden" name="{{ $color_name }}_transparent" value="0">
                    <input type="checkbox"
                        {{ isset($option_settings[$color_name . '_transparent']) && $option_settings[$color_name . '_transparent'] == 1 ? 'checked' : '' }}
                        name="{{ $color_name }}_transparent" id="{{ $color_name }}_transparent" value="1">
                    <span class="checkmark"></span>
                </label>
                <label class="black font-16"
                    for="{{ $color_name }}_transparent">{{ translate('Transparent') }}</label>
            </div>
        </div>
    </div>
</div>
