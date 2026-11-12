    {{-- Breaking News Show/Hide Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Breaking News Option'),
        'switch_name' => 'header_' . $header . '_breaking',
    ])

    {{-- Breaking News Variation Field --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-4">
            <label class="font-16 bold black">{{ translate('Breaking News Variations') }}
            </label>
            <span class="d-block">{{ translate('Choose breaking news variation from here.') }}</span>
        </div>
        <div class="col-xl-6 offset-xl-1 row">
            <select class="form-control select breaking-variation" name="header_{{ $header }}_breaking_variation"
                id="header_{{ $header }}_breaking_variation">
                <option value="variation-1"
                    {{ isset($option_settings['header_' . $header . '_breaking_variation']) && $option_settings['header_' . $header . '_breaking_variation'] == 'variation-1' ? 'selected' : '' }}>
                    Variation 1</option>
                <option value="variation-2"
                    {{ isset($option_settings['header_' . $header . '_breaking_variation']) && $option_settings['header_' . $header . '_breaking_variation'] == 'variation-2' ? 'selected' : '' }}>
                    Variation 2</option>
            </select>
        </div>
        <div class="col-12 mt-3" data-variation="header_{{ $header }}_breaking_variation">
            <img src="{{ asset('themes/newslooks/public/img/breaking/breaking-variation-1.png') }}"
                alt="breaking-variation-1"
                class="{{ isset($option_settings['header_' . $header . '_breaking_variation']) && $option_settings['header_' . $header . '_breaking_variation'] == 'variation-2' ? 'd-none' : '' }} breaking-variation-1">

            <img src="{{ asset('themes/newslooks/public/img/breaking/breaking-variation-2.png') }}"
                alt="breaking-variation-2"
                class="{{ isset($option_settings['header_' . $header . '_breaking_variation']) && $option_settings['header_' . $header . '_breaking_variation'] == 'variation-2' ? '' : 'd-none' }} breaking-variation-2">
        </div>
    </div>

    {{-- Breaking News Position Field --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-4">
            <label class="font-16 bold black">{{ translate('Breaking News Position') }}
            </label>
            <span class="d-block">{{ translate('Choose breaking news position.') }}</span>
        </div>
        <div class="col-xl-6 offset-xl-1 row">
            <select class="form-control select" name="header_{{ $header }}_breaking_position"
                id="header_{{ $header }}_breaking_position">
                <option value="top"
                    {{ isset($option_settings['header_' . $header . '_breaking_position']) && $option_settings['header_' . $header . '_breaking_position'] == 'top' ? 'selected' : '' }}>
                    Header Top</option>
                <option value="bottom"
                    {{ isset($option_settings['header_' . $header . '_breaking_position']) && $option_settings['header_' . $header . '_breaking_position'] == 'bottom' ? 'selected' : '' }}>
                    Header Bottom</option>
            </select>
        </div>
    </div>

    {{-- Breaking News Text Field --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-4">
            <label for="header_{{ $header }}_breaking_text"
                class="font-16 bold black">{{ translate('Breaking News Text') }}
            </label>
        </div>
        <div class="col-xl-6 offset-xl-1 row">
            <input type="text" name="header_{{ $header }}_breaking_text"
                id="header_{{ $header }}_breaking_text" class="form-control"
                placeholder="{{ translate('Breaking News Text') }}"
                value="{{ isset($option_settings['header_' . $header . '_breaking_text']) ? $option_settings['header_' . $header . '_breaking_text'] : '' }}">
                <small>{{ translate('Transalate to another language') }} <a
                    href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
        </div>
    </div>

    {{-- Breaking News Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Breaking News Variation 1 Background Color'),
        'color_name' => 'header_' . $header . '_breaking_bg_color',
    ])
