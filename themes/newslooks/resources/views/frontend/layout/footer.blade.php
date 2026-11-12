@php
    $footerOption = getThemeOption('footer', $active_theme->id);

    $variant = isset($footerOption['footer_variation']) ? $footerOption['footer_variation'] : 'footer-1';

    $copyright_text = isset($generalSettings['copyright_text']) ? $generalSettings['copyright_text'] : '';
    $logo = isset($footerOption['footer_logo']) ? getFilePath($footerOption['footer_logo']) : null;
@endphp

@include('theme/newslooks::frontend.includes.footers.'.$variant)
