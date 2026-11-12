@php
    $footerOption = getThemeOption('footer', $active_theme->id);

    $variant = isset($data['footer_variation']) ? $data['footer_variation'] : 'footer-1';

    $copyright_text = isset($generalSettings['copyright_text']) ? $generalSettings['copyright_text'] : '';
    $logo = isset($footerOption['footer_logo']) ? getFilePath($footerOption['footer_logo']) : null;
@endphp

@include('theme/newslooks::frontend.includes.footers.'.$variant)

