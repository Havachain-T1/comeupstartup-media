<h3 class="black mb-3">{{ translate('404 Page') }}</h3>
<input type="hidden" name="option_name" value="page_404">

{{-- Page 404 Image Field --}}
<div id="custom_preloader_type_image">
    <div class="form-group row py-3 border-bottom">
        <div class="col-xl-4">
            <label for="page_404_image" class="font-16 bold black">{{ translate('Page 404 Image') }}
            </label>
            <span class="d-block">{{ translate('Set 404 Page Image.') }}</span>
        </div>
        <div class="col-xl-6 offset-xl-1">
            @include('core::base.includes.media.media_input', [
                'input' => 'page_404_image',
                'data' => isset($option_settings['page_404_image']) ? $option_settings['page_404_image'] : null,
            ])
        </div>
    </div>
</div>

{{-- 404 Page Subtittle Field Start --}}
<div class="form-group row py-3 border-bottom">
    <div class="col-xl-4">
        <label for="page_404_title" class="font-16 bold black">{{ translate('Page Title') }}
        </label>
        <span class="d-block">{{ translate('Set Page Title') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="page_404_title" id="page_404_title" class="form-control"
            value="{{ isset($option_settings['page_404_title']) ? $option_settings['page_404_title'] : '' }}"
            placeholder="{{ translate('Page Title') }}">
        <small>{{ translate('Transalate to another language') }} <a
                href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
    </div>
</div>

{{-- 404 Page Subtittle Field Start --}}
<div class="form-group row py-3 border-bottom">
    <div class="col-xl-4">
        <label for="page_404_subtitle" class="font-16 bold black">{{ translate('Page Subtitle') }}
        </label>
        <span class="d-block">{{ translate('Set Page Subtitle') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="page_404_subtitle" id="page_404_subtitle" class="form-control"
            value="{{ isset($option_settings['page_404_subtitle']) ? $option_settings['page_404_subtitle'] : '' }}"
            placeholder="{{ translate('Page Subtitle') }}">
        <small>{{ translate('Transalate to another language') }} <a
                href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
    </div>
</div>

{{-- Button Before Text Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4">
        <label for="page_404_button_text" class="font-16 bold black">{{ translate('Button Text') }}
        </label>
        <span class="d-block">{{ translate('Button Before Text') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="page_404_button_text" id="page_404_button_text" class="form-control"
            value="{{ isset($option_settings['page_404_button_text']) ? $option_settings['page_404_button_text'] : '' }}"
            placeholder="{{ translate('Page Subtitle') }}">
        <small>{{ translate('Transalate to another language') }} <a
                href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
    </div>
</div>

{{-- Custom page 404 Switch Field Start --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Custom 404 Style'),
    'switch_name' => 'custom_404_page',
])

{{-- Custom 404 Switch On Field Start --}}
<div id="custom_404_page_switch_on_field">

    {{-- Page 404 Button Bg Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Page 404 Button Background Color'),
        'color_name' => 'page_404_bg_color',
    ])

    {{-- Page 404 Button text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Page 404 Button Text After Color'),
        'color_name' => 'page_404_text_color',
    ])
</div>
{{-- Custom 404 Switch On Field End --}}
