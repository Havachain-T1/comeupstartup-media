@php
    $headerOption = getThemeOption('header', $active_theme->id);

    $top_menu_position = getMenuPositionId(config('newslooks.menu_position')[0]);
    $top_menuData = getMenuStructure($top_menu_position);
    $top_menuTree = buildMenuTree($top_menuData);

    $main_menu_position = getMenuPositionId(config('newslooks.menu_position')[1]);
    $main_menuData = getMenuStructure($main_menu_position);
    $main_menuTree = buildMenuTree($main_menuData);

    $variant = isset($headerOption['header_variation']) ? $headerOption['header_variation'] : 'header-1';

    $logo = isset($generalSettings['white_background_logo']) ? $generalSettings['white_background_logo'] : null;
    $mobile_logo = isset($generalSettings['white_mobile_background_logo']) ? $generalSettings['white_mobile_background_logo'] : null;

    $languages = getAllActiveLanguages();
@endphp

@include('theme/newslooks::frontend.includes.headers.variants.'.$variant)