{{-- Header Option Header --}}
<h3 class="black mb-3">{{ translate('Header') }}</h3>
<input type="hidden" name="option_name" value="header">

{{-- Header Top Multi-Language Switch --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Header Top Multi-Language'),
    'switch_name' => 'header_top_multi_language',
])

{{-- Header Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-4">
        <label class="font-16 bold black">{{ translate('Header Variations') }}
        </label>
        <span class="d-block">{{ translate('Choose header variation from here.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1 row">
        <select class="form-control select" name="header_variation" id="header_variation">
            <option value="header-1"
                {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-1' ? 'selected' : '' }}>
                Header 1</option>
            <option value="header-2"
                {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-2' ? 'selected' : '' }}>
                Header 2</option>
            <option value="header-3"
                {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-3' ? 'selected' : '' }}>
                Header 3</option>
            <option value="header-4"
                {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-4' ? 'selected' : '' }}>
                Header 4</option>
            <option value="header-5"
                {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-5' ? 'selected' : '' }}>
                Header 5</option>
        </select>
    </div>
    <div class="col-12 mt-4" data-variation="header_variation">
        <img src="{{ asset('themes/newslooks/public/img/header-variation/header-1.png') }}" alt="variation-1"
            class="{{ isset($option_settings['header_variation']) && $option_settings['header_variation'] != 'header-1' ? 'd-none' : '' }} header-1">

        <img src="{{ asset('themes/newslooks/public/img/header-variation/header-2.png') }}" alt="variation-2"
            class="{{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-2' ? '' : 'd-none' }} header-2">

        <img src="{{ asset('themes/newslooks/public/img/header-variation/header-3.png') }}" alt="variation-3"
            class="{{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-3' ? '' : 'd-none' }} header-3">

        <img src="{{ asset('themes/newslooks/public/img/header-variation/header-4.png') }}" alt="variation-4"
            class="{{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-4' ? '' : 'd-none' }} header-4">

        <img src="{{ asset('themes/newslooks/public/img/header-variation/header-5.png') }}" alt="variation-5"
            class="{{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-5' ? '' : 'd-none' }} header-5">
    </div>
</div>
{{-- Header Field End --}}

{{-- Header Variation 1 --}}
<div id="header-1-fields"
    class="variant-field {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] != 'header-1' ? 'd-none' : '' }}">
    {{-- Header Top Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Header Top'),
        'switch_name' => 'header_top_h1',
    ])

    {{-- Header Top Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Text Color'),
        'color_name' => 'header_top_h1_text_color',
    ])

    {{-- Header Top Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Background Color'),
        'color_name' => 'header_top_h1_bg_color',
    ])

    {{-- Header Middle Main menu Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Text Color'),
        'color_name' => 'header_middle_h1_menu_text_color',
    ])

    {{-- Header Main Menu Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Hover Color'),
        'color_name' => 'header_middle_h1_menu_hover_text_color',
    ])

    {{-- Header Middle Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Background Color'),
        'color_name' => 'header_middle_h1_bg_color',
    ])

    {{-- Header Bottom Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Background Color'),
        'color_name' => 'header_bottom_h1_bg_color',
    ])

    {{-- Header Top Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Header Bottom Social Option'),
        'sub_text' => translate('Switch header bottom social option.'),
        'switch_name' => 'header_bottom_h1_social',
    ])

    {{-- Header Bottom Social Icon Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Social Icon Color'),
        'color_name' => 'header_bottom_h1_social_color',
    ])

    {{-- Header Bottom Social Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Social Background Color'),
        'color_name' => 'header_bottom_h1_social_bg_color',
    ])

    {{-- Header Bottom Social Icon Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Social Icon Hover Color'),
        'color_name' => 'header_bottom_h1_social_hover_color',
    ])

    {{-- Header Bottom Social Background Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Social Background Hover Color'),
        'color_name' => 'header_bottom_h1_social_hover_bg_color',
    ])

    {{-- Breaking News Field --}}
    @include('theme/newslooks::backend.theme.components.breaking-news', ['header' => 'h1'])

</div>

{{-- Header Variation 2 --}}
<div id="header-2-fields"
    class="variant-field {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-2' ? '' : 'd-none' }}">
    {{-- Header Top Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Header Top'),
        'switch_name' => 'header_top_h2',
    ])

    {{-- Header Top Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Text Color'),
        'color_name' => 'header_top_h2_text_color',
    ])

    {{-- Header Top Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Background Color'),
        'color_name' => 'header_top_h2_bg_color',
    ])

    {{-- Header Middle Main menu Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Text Color'),
        'color_name' => 'header_middle_h2_menu_text_color',
    ])

    {{-- Header Main Menu Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Hover Color'),
        'color_name' => 'header_middle_h2_menu_hover_text_color',
    ])

    {{-- Header Middle Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Background Color'),
        'color_name' => 'header_middle_h2_bg_color',
    ])

    {{-- Header Bottom Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Background Color'),
        'color_name' => 'header_bottom_h2_bg_color',
    ])

    {{-- Ads Field Start --}}
    <div id="custom_preloader_type_image">

        <div class="form-group row py-3 border-bottom">
            <div class="col-xl-4">
                <label for="preloader_image" class="font-16 bold black">{{ translate('Ads') }}
                </label>
                <span class="d-block">{{ translate('Select ad for header') }}</span>
            </div>
            <div class="col-xl-6 offset-xl-1">
                @php
                    $header_bottom_ad_id = isset($option_settings['header_bottom_h2_ads_image'])
                        ? $option_settings['header_bottom_h2_ads_image']
                        : null;
                    $header_bottom_selected_ad = Core\Models\CustomAd::where('id', $header_bottom_ad_id)->first();
                @endphp
                <select name="header_bottom_h2_ads_image" class="form-control header2-builder-ad-selector mb-2">
                    @if ($header_bottom_selected_ad != null)
                        <option value="{{ $header_bottom_selected_ad->id }}">
                            {{ $header_bottom_selected_ad->title . '-' . $header_bottom_selected_ad->type . '-' . $header_bottom_selected_ad->size }}
                        </option>
                    @endif
                </select>
                <p>{{ translate('You can manage your ads from') }} <a href="{{ route('core.ads.list') }}">
                        Ad Manager
                    </a>
                </p>
            </div>
        </div>
    </div>

    {{-- Breaking News Field --}}
    @include('theme/newslooks::backend.theme.components.breaking-news', ['header' => 'h2'])
</div>

{{-- Header Variation 3 --}}
<div id="header-3-fields"
    class="variant-field {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-3' ? '' : 'd-none' }}">

    {{-- Header Top Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Header Top'),
        'switch_name' => 'header_top_h3',
    ])

    {{-- Header Top Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Text Color'),
        'color_name' => 'header_top_h3_text_color',
    ])

    {{-- Header Top Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Background Color'),
        'color_name' => 'header_top_h3_bg_color',
    ])

    {{-- Header Middle Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Background Color'),
        'color_name' => 'header_middle_h3_bg_color',
    ])

    {{-- Ads Field Start --}}
    <div id="custom_preloader_type_image">
        <div class="form-group row py-3 border-bottom">
            <div class="col-xl-4">
                <label for="preloader_image" class="font-16 bold black">{{ translate('Ads') }}
                </label>
                <span class="d-block">{{ translate('Select ad for header') }}</span>
            </div>
            <div class="col-xl-6 offset-xl-1">
                @php
                    $selected_ad_id = isset($option_settings['header_middle_h3_ads_image'])
                        ? $option_settings['header_middle_h3_ads_image']
                        : null;
                    $selected_ad = Core\Models\CustomAd::where('id', $selected_ad_id)->first();
                @endphp
                <select name="header_middle_h3_ads_image" class="form-control header-builder-ad-selector mb-2">
                    @if ($selected_ad != null)
                        <option value="{{ $selected_ad->id }}">
                            {{ $selected_ad->title . '-' . $selected_ad->type . '-' . $selected_ad->size }}
                        </option>
                    @endif
                </select>
                <p>{{ translate('You can manage your ads from') }} <a href="{{ route('core.ads.list') }}">Ad
                        Manager</a>
                </p>
            </div>
        </div>
    </div>

    {{-- Header Middle Main menu Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Text Color'),
        'color_name' => 'header_bottom_h3_menu_text_color',
    ])

    {{-- Header Main Menu Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Hover Color'),
        'color_name' => 'header_bottom_h3_menu_hover_text_color',
    ])

    {{-- Header Bottom Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Background Color'),
        'color_name' => 'header_bottom_h3_bg_color',
    ])

    {{-- Breaking News Field --}}
    @include('theme/newslooks::backend.theme.components.breaking-news', ['header' => 'h3'])
</div>

{{-- Header Variation 4 --}}
<div id="header-4-fields"
    class="variant-field {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-4' ? '' : 'd-none' }}">

    {{-- Header Top Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Header Top'),
        'switch_name' => 'header_top_h4',
    ])

    {{-- Header Top Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Text Color'),
        'color_name' => 'header_top_h4_text_color',
    ])

    {{-- Header Top Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Background Color'),
        'color_name' => 'header_top_h4_bg_color',
    ])

    {{-- Header Main menu Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Text Color'),
        'color_name' => 'header_bottom_h4_menu_text_color',
    ])

    {{-- Header Main Menu Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Menu Hover Color'),
        'color_name' => 'header_bottom_h4_menu_hover_text_color',
    ])

    {{-- Header Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Main Background Color'),
        'color_name' => 'header_bottom_h4_bg_color',
    ])

    {{-- Breaking News Field --}}
    @include('theme/newslooks::backend.theme.components.breaking-news', ['header' => 'h4'])
</div>

{{-- Header Variation 5 --}}
<div id="header-5-fields"
    class="variant-field {{ isset($option_settings['header_variation']) && $option_settings['header_variation'] == 'header-5' ? '' : 'd-none' }}">

    {{-- Header Top Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Header Top'),
        'switch_name' => 'header_top_h5',
    ])

    {{-- Header Top Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Text Color'),
        'color_name' => 'header_top_h5_text_color',
    ])

    {{-- Header Top Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Top Background Color'),
        'color_name' => 'header_top_h5_bg_color',
    ])

    {{-- Header Middle Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Background Color'),
        'color_name' => 'header_middle_h5_bg_color',
    ])

    {{-- Header Middle Switch --}}
    @include('theme/newslooks::backend.theme.components.switch', [
        'text' => translate('Header Middle Social Option'),
        'sub_text' => translate('Switch header middle social option.'),
        'switch_name' => 'header_middle_h5_social',
    ])

    {{-- Header Middle Social Icon Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Social Icon Color'),
        'color_name' => 'header_middle_h5_social_color',
    ])

    {{-- Header Middle Social Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Social Background Color'),
        'color_name' => 'header_middle_h5_social_bg_color',
    ])

    {{-- Header Middle Social Icon Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Social Icon Hover Color'),
        'color_name' => 'header_middle_h5_social_hover_color',
    ])

    {{-- Header Middle Social Background Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Middle Social Background Hover Color'),
        'color_name' => 'header_middle_h5_social_hover_bg_color',
    ])

    {{-- Header Bottom Main menu Text Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Menu Text Color'),
        'color_name' => 'header_bottom_h5_menu_text_color',
    ])

    {{-- Header Bottom Menu Hover Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Menu Hover Color'),
        'color_name' => 'header_bottom_h5_menu_hover_text_color',
    ])

    {{-- Header Bottom Background Color Field --}}
    @include('theme/newslooks::backend.theme.components.color', [
        'text' => translate('Header Bottom Background Color'),
        'color_name' => 'header_bottom_h5_bg_color',
    ])

    {{-- Breaking News Field --}}
    @include('theme/newslooks::backend.theme.components.breaking-news', ['header' => 'h5'])
</div>
