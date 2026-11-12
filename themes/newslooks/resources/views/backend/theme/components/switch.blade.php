<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4">
        <label class="font-16 bold black">{{ $text }}
        </label>
        @if (isset($sub_text))
            <span class="d-block">{{ $sub_text }}</span>
        @endif
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="{{ $switch_name }}" value="0">
            <input type="checkbox"
                {{ isset($option_settings[$switch_name]) && $option_settings[$switch_name] == 1 ? 'checked' : '' }}
                name="{{ $switch_name }}" id="{{ $switch_name }}" value="1">
            <span class="control" id="{{ $switch_name }}_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>