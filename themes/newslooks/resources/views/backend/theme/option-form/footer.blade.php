@php
    $menu_groups = getAllMenuGroups();
@endphp

<h3 class="black mb-3">{{ translate('Footer') }}</h3>
<input type="hidden" name="option_name" value="footer">

{{-- Footer Logo --}}
<div id="custom_preloader_type_image">
    <div class="form-group row py-3 border-bottom">
        <div class="col-xl-4">
            <label for="footer_logo" class="font-16 bold black">{{ translate('Footer Logo') }}
            </label>
            <span class="d-block">{{ translate('Set Footer Logo.') }}</span>
        </div>
        <div class="col-xl-6 offset-xl-1">
            @include('core::base.includes.media.media_input', [
                'input' => 'footer_logo',
                'data' => isset($option_settings['footer_logo']) ? $option_settings['footer_logo'] : null,
            ])
        </div>
    </div>
</div>

{{-- Footer Variation Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4">
        <label class="font-16 bold black">{{ translate('Footer Variations') }}
        </label>
        <span class="d-block">{{ translate('Choose footer variation from here.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <select class="form-control" name="footer_variation" id="footer_variation">
            <option value="footer-1"
                {{ isset($option_settings['footer_variation']) && $option_settings['footer_variation'] == 'footer-1' ? 'selected' : '' }}>
                Footer 1</option>
            <option value="footer-2"
                {{ isset($option_settings['footer_variation']) && $option_settings['footer_variation'] == 'footer-2' ? 'selected' : '' }}>
                Footer 2</option>
        </select>
    </div>
    <div class="col-12 mt-4" data-variation="footer_variation">
        <img src="{{ asset('themes/newslooks/public/img/footer-variation/footer-1.png') }}" alt="variation-1"
            class="{{ isset($option_settings['footer_variation']) && $option_settings['footer_variation'] != 'footer-1' ? 'd-none' : '' }} footer-1">

        <img src="{{ asset('themes/newslooks/public/img/footer-variation/footer-2.png') }}" alt="variation-2"
            class="{{ isset($option_settings['footer_variation']) && $option_settings['footer_variation'] == 'footer-2' ? '' : 'd-none' }} footer-2">

    </div>
</div>

{{-- Footer Variation 1 --}}
<div id="footer-1-fields"
    class="variant-field {{ isset($option_settings['footer_variation']) && $option_settings['footer_variation'] != 'footer-1' ? 'd-none' : '' }}">

    {{-- Newsletter On Footer Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Newsletter On Footer'),
        'switch_name' => 'footer_1_newsletter',
    ])

    {{-- Newsletter On Footer Switch on Fields --}}
    <div id="footer_newsletter_switch_on_field">

        {{-- Newletter Position --}}
        <div class="form-group row py-4 border-bottom">
            <div class="col-xl-4">
                <label class="font-16 bold black">{{ translate('Footer Newsletter Position') }}
                </label>
                <span class="d-block">{{ translate('Choose footer newsletter position.') }}</span>
            </div>
            <div class="col-xl-6 offset-xl-1">
                <select class="form-control" name="footer_1_newsletter_position" id="footer_1_newsletter_position">
                    <option value="top" @selected(isset($option_settings['footer_1_newsletter_position']) && $option_settings['footer_1_newsletter_position'] == 'top')>
                        Top</option>
                    <option value="bottom" @selected(isset($option_settings['footer_1_newsletter_position']) && $option_settings['footer_1_newsletter_position'] == 'bottom')>
                        Bottom</option>
                </select>
            </div>
        </div>

        {{-- Newsletter Background Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Footer Newsletter Background Color'),
            'color_name' => 'footer_1_newsletter_bg_color',
        ])

        {{-- Newsletter Button Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Footer Newsletter Button Color'),
            'color_name' => 'footer_1_newsletter_button_bg_color',
        ])

        {{-- Newsletter Button Text Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Footer Newsletter Button Text Color'),
            'color_name' => 'footer_1_newsletter_button_text_color',
        ])

        {{-- Newsletter Social Icon Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Newsletter Social Icon Color'),
            'color_name' => 'footer_1_newsletter_social_color',
        ])

        {{-- Newsletter Social Background Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Newsletter Social Background Color'),
            'color_name' => 'footer_1_newsletter_social_bg_color',
        ])

        {{-- Newsletter Social Icon Hover Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Newsletter Social Icon Hover Color'),
            'color_name' => 'footer_1_newsletter_social_hover_color',
        ])

        {{-- Newsletter Social Background Hover Color Field --}}
        @include('theme/newslooks::backend.theme.components.color', [
            'text' => translate('Newsletter Social Background Hover Color'),
            'color_name' => 'footer_1_newsletter_social_hover_bg_color',
        ])
    </div>
    <hr>

    {{-- Footer Widget Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Widget Background Color'),
        'color_name' => 'footer_1_widget_bg_color',
    ])

    {{-- Footer Widget Title Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Widget Title Color'),
        'color_name' => 'footer_1_widget_title_color',
    ])

    {{-- Footer Widget Title Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Widget Title After Color'),
        'color_name' => 'footer_1_widget_title_after_color',
    ])

    {{-- Footer Widget Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Widget Text Color'),
        'color_name' => 'footer_1_widget_text_color',
    ])

    {{-- Footer Widget Anchor Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Widget Anchor Hover Color'),
        'color_name' => 'footer_1_widget_anchor_hover_color',
    ])
    <hr>

    {{-- Footer Bottom BG Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Bottom Background Color'),
        'color_name' => 'footer_1_bottom_bg_color',
    ])

    {{-- Footer Bottom Menu Select Field --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-4">
            <label class="font-16 bold black">{{ translate('Footer Bottom Menu') }}
            </label>
            <span class="d-block">{{ translate('Choose footer bottom menu.') }}</span>
        </div>
        <div class="col-xl-6 offset-xl-1">
            <select class="form-control" name="footer_1_bottom_menu" id="footer_1_bottom_menu">
                @foreach ($menu_groups as $group)
                    <option value="{{ $group->id }}" @selected(isset($option_settings['footer_1_bottom_menu']) && $option_settings['footer_1_bottom_menu'] == $group->id)>
                        {{ $group->name }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>

</div>

{{-- Footer Variation 2 --}}
<div id="footer-2-fields"
    class="variant-field {{ isset($option_settings['footer_variation']) && $option_settings['footer_variation'] == 'footer-2' ? '' : 'd-none' }}">

    {{-- Footer Bottom BG Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Middle Background Color'),
        'color_name' => 'footer_2_middle_bg_color',
    ])

    {{-- Footer Middle Text --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-4">
            <label class="font-16 bold black">{{ translate('Footer Middle Text') }}
            </label>
        </div>
        <div class="col-xl-6 offset-xl-1">
            <input type="text" name="footer_2_middle_text" class="form-control"
                value="{{ isset($option_settings['footer_2_middle_text']) ? $option_settings['footer_2_middle_text'] : '' }}"
                placeholder="{{ translate('Footer Middle Text') }}">
            <small>{{ translate('Transalate to another language') }} <a
                    href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
        </div>
    </div>

    {{-- Footer Middle Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Middle Text Color'),
        'color_name' => 'footer_2_middle_text_color',
    ])

    {{-- Footer Middle Social Icon Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Middle Social Icon Color'),
        'color_name' => 'footer_2_middle_social_color',
    ])

    {{-- Footer Middle Scoial Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Middle Social Background Color'),
        'color_name' => 'footer_2_middle_social_bg_color',
    ])

    {{-- Footer Middle Social Icon Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Middle Social Icon Hover Color'),
        'color_name' => 'footer_2_middle_social_hover_color',
    ])

    {{-- Footer Middle Social Background Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Middle Social Background Hover Color'),
        'color_name' => 'footer_2_middle_social_hover_bg_color',
    ])
    <hr>

    {{-- Footer Bottom BG Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Footer Bottom Background Color'),
        'color_name' => 'footer_2_bottom_bg_color',
    ])

    {{-- Footer Bottom Menu Select Field --}}
    <div class="form-group row py-4 border-bottom">
        <div class="col-xl-4">
            <label class="font-16 bold black">{{ translate('Footer Bottom Menu') }}
            </label>
            <span class="d-block">{{ translate('Choose footer bottom menu.') }}</span>
        </div>
        <div class="col-xl-6 offset-xl-1">
            <select class="form-control" name="footer_2_bottom_menu" id="footer_2_bottom_menu">
                @foreach ($menu_groups as $group)
                    <option value="{{ $group->id }}" @selected(isset($option_settings['footer_2_bottom_menu']) && $option_settings['footer_2_bottom_menu'] == $group->id)>
                        {{ $group->name }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>

</div>
