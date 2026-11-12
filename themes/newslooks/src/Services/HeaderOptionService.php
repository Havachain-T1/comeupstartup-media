<?php

namespace Theme\NewsLooks\Services;


class HeaderOptionService
{
    /**
     * Header Style CSS
     */
    public function headerService($style)
    {
        // Save the Text Field in Frontend Translation
        if (isset($style['header_h1_breaking_text'])) {
            storeFrontendTranslation($style['header_h1_breaking_text']);
        }

        if (isset($style['header_h2_breaking_text'])) {
            storeFrontendTranslation($style['header_h2_breaking_text']);
        }

        if (isset($style['header_h3_breaking_text'])) {
            storeFrontendTranslation($style['header_h3_breaking_text']);
        }

        if (isset($style['header_h4_breaking_text'])) {
            storeFrontendTranslation($style['header_h4_breaking_text']);
        }

        if (isset($style['header_h5_breaking_text'])) {
            storeFrontendTranslation($style['header_h5_breaking_text']);
        }


        $updateStyle = [];
        foreach ($style as $key => $value) {

            if (str_contains($key, 'transparent')) {
                $color = str_replace('_transparent', '', $key);
                $style[$color] = $value == 1 ? 'transparent' : $style[$color];
                unset($style[$key]);
                continue;
            }

            if (str_contains($key, 'h1') && $key != 'header_top_h1') {
                $updateStyle['h1'][$key] = $value;
            }

            if (str_contains($key, 'h2') && $key != 'header_top_h2') {
                $updateStyle['h2'][$key] = $value;
            }

            if (str_contains($key, 'h3') && $key != 'header_top_h3') {
                $updateStyle['h3'][$key] = $value;
            }

            if (str_contains($key, 'h4') && $key != 'header_top_h4') {
                $updateStyle['h4'][$key] = $value;
            }

            if (str_contains($key, 'h5') && $key != 'header_top_h5') {
                $updateStyle['h5'][$key] = $value;
            }
        }

        $themeOption = [];
        $styleProperties = "";

        foreach ($updateStyle as $key => $value) {
            switch ($key) {
                case 'h1':
                    $h1Data = $this->headerV1CssArray($value);
                    $themeOption += $h1Data;
                    break;

                case 'h2':
                    $h2Data = $this->headerV2CssArray($value);
                    $themeOption += $h2Data;
                    break;

                case 'h3':
                    $h3Data = $this->headerV3CssArray($value);
                    $themeOption += $h3Data;
                    break;

                case 'h4':
                    $h4Data = $this->headerV4CssArray($value);
                    $themeOption += $h4Data;
                    break;

                case 'h5':
                    $h5Data = $this->headerV5CssArray($value);
                    $themeOption += $h5Data;
                    break;

                default:

                    break;
            }
        }

        $styleProperties = makeCssProperties($themeOption);
        $path = base_path('themes/newslooks/public/theme-option/header.css');
        setFolderPermissions($path);
        file_put_contents($path, $styleProperties);
    }

    /**
     * Header Variation One CSS Array Create
     */
    private function headerV1CssArray(array $h1Data): array
    {
        $updateH1Data = [];

        foreach ($h1Data as $key => $value) {
            $h1_split = explode('_h1_', $key);
            $value = $value . ' !important;';

            if (str_contains($h1_split[1], 'social')) {

                if ($h1_split[1] == 'social_hover_bg_color') {
                    $updateH1Data['#' . $h1_split[0] . '_h1 .widget.widget-socials.with-border li a:hover']['background-color'] = $value;
                }

                if ($h1_split[1] == 'social_bg_color') {
                    $updateH1Data['#' . $h1_split[0] . '_h1 .widget.widget-socials.with-border li a']['background-color'] = $value;
                }

                if ($h1_split[1] == 'social_hover_color') {
                    $updateH1Data['#' . $h1_split[0] . '_h1 .widget.widget-socials.with-border li a:hover']['color'] = $value;
                    $updateH1Data['#' . $h1_split[0] . '_h1 .widget.widget-socials.with-border li a:hover']['border-color'] = $value;
                }

                if ($h1_split[1] == 'social_color') {
                    $updateH1Data['#' . $h1_split[0] . '_h1 .widget.widget-socials.with-border li a']['color'] = $value;
                }
                continue;
            }

            if (str_contains($h1_split[1], 'menu')) {
                if ($h1_split[1] == 'menu_text_color') {
                    $updateH1Data['#' . $h1_split[0] . '_h1 .menu-trigger-btn']['color'] = $value;
                    $updateH1Data['#' . $h1_split[0] . '_h1 .header-right-menu ul li a']['color'] = $value;
                    $updateH1Data['#' . $h1_split[0] . '_h1 .horizontal-menu > .nav > li > a']['color'] = $value;
                    continue;
                }
                if ($h1_split[1] == 'menu_hover_text_color') {
                    $updateH1Data['#' . $h1_split[0] . '_h1 .list-has-separator > .nav > li:hover > a']['color'] = $value;
                    $updateH1Data['#' . $h1_split[0] . '_h1 .horizontal-menu > .nav li .submenu li:hover > a']['color'] = $value;
                    continue;
                }
            }

            if ($h1_split[1] == 'bg_color') {
                $updateH1Data['#' . $h1_split[0] . '_h1']['background-color'] = $value;
                continue;
            }

            if ($h1_split[1] == 'text_color') {
                $updateH1Data['#' . $h1_split[0] . '_h1 .header-nav.style--two a']['color'] = $value;
            }

            if ($h1_split[1] == 'breaking_bg_color') {
                $updateH1Data['.header_h1_breaking']['background-color'] = $value;
            }
        }

        return $updateH1Data;
    }

    /**
     * Header Variation Two CSS Array Create
     */
    private function headerV2CssArray(array $h2Data): array
    {
        $updateH2Data = [];

        foreach ($h2Data as $key => $value) {
            $h2_split = explode('_h2_', $key);
            $value = $value . ' !important;';

            if (str_contains($h2_split[1], 'menu')) {
                if ($h2_split[1] == 'menu_text_color') {
                    $updateH2Data['#' . $h2_split[0] . '_h2 .menu-trigger-btn']['color'] = $value;
                    $updateH2Data['#' . $h2_split[0] . '_h2 .header-right-menu ul li a']['color'] = $value;
                    $updateH2Data['#' . $h2_split[0] . '_h2 .horizontal-menu > .nav > li > a']['color'] = $value;
                    continue;
                }
                if ($h2_split[1] == 'menu_hover_text_color') {
                    $updateH2Data['#' . $h2_split[0] . '_h2 .list-has-separator > .nav > li:hover > a']['color'] = $value;
                    $updateH2Data['#' . $h2_split[0] . '_h2 .horizontal-menu > .nav li .submenu li:hover > a']['color'] = $value;
                    continue;
                }
            }

            if ($h2_split[1] == 'bg_color') {
                $updateH2Data['#' . $h2_split[0] . '_h2']['background-color'] = $value;
                continue;
            }

            if ($h2_split[1] == 'text_color') {
                $updateH2Data['#' . $h2_split[0] . '_h2 .header-nav.style--two a']['color'] = $value;
            }

            if ($h2_split[1] == 'breaking_bg_color') {
                $updateH2Data['.header_h2_breaking']['background-color'] = $value;
            }
        }

        return $updateH2Data;
    }

    /**
     * Header Variation Three CSS Array Create
     */
    private function headerV3CssArray(array $h3Data): array
    {
        $updateH3Data = [];

        foreach ($h3Data as $key => $value) {
            $h3_split = explode('_h3_', $key);
            $value = $value . ' !important;';

            if (str_contains($h3_split[1], 'menu')) {
                if ($h3_split[1] == 'menu_text_color') {
                    $updateH3Data['#' . $h3_split[0] . '_h3 .menu-trigger-btn']['color'] = $value;
                    $updateH3Data['#' . $h3_split[0] . '_h3 .header-right-menu ul li a']['color'] = $value;
                    $updateH3Data['#' . $h3_split[0] . '_h3 .horizontal-menu > .nav > li > a']['color'] = $value;
                    continue;
                }
                if ($h3_split[1] == 'menu_hover_text_color') {
                    $updateH3Data['#' . $h3_split[0] . '_h3 .list-has-separator > .nav > li:hover > a']['color'] = $value;
                    $updateH3Data['#' . $h3_split[0] . '_h3 .horizontal-menu > .nav li .submenu li:hover > a']['color'] = $value;
                    continue;
                }
            }

            if ($h3_split[1] == 'bg_color') {
                $updateH3Data['#' . $h3_split[0] . '_h3']['background-color'] = $value;
                continue;
            }

            if ($h3_split[1] == 'text_color') {
                $updateH3Data['#' . $h3_split[0] . '_h3 .header-nav.style--two a']['color'] = $value;
            }

            if ($h3_split[1] == 'breaking_bg_color') {
                $updateH3Data['.header_h3_breaking']['background-color'] = $value;
            }
        }

        return $updateH3Data;
    }

    /**
     * Header Variation Three CSS Array Create
     */
    private function headerV4CssArray(array $h4Data): array
    {
        $updateH4Data = [];

        foreach ($h4Data as $key => $value) {
            $h4_split = explode('_h4_', $key);
            $value = $value . ' !important;';

            if (str_contains($h4_split[1], 'menu')) {
                if ($h4_split[1] == 'menu_text_color') {
                    $updateH4Data['#' . $h4_split[0] . '_h4 .menu-trigger-btn']['color'] = $value;
                    $updateH4Data['#' . $h4_split[0] . '_h4 .header-right-menu ul li a']['color'] = $value;
                    $updateH4Data['#' . $h4_split[0] . '_h4 .horizontal-menu > .nav > li > a']['color'] = $value;
                    continue;
                }
                if ($h4_split[1] == 'menu_hover_text_color') {
                    $updateH4Data['#' . $h4_split[0] . '_h4 .list-has-separator > .nav > li:hover > a']['color'] = $value;
                    $updateH4Data['#' . $h4_split[0] . '_h4 .horizontal-menu > .nav li .submenu li:hover > a']['color'] = $value;
                    continue;
                }
            }

            if ($h4_split[1] == 'bg_color') {
                $updateH4Data['#' . $h4_split[0] . '_h4']['background-color'] = $value;
                continue;
            }

            if ($h4_split[1] == 'text_color') {
                $updateH4Data['#' . $h4_split[0] . '_h4 .header-nav.style--two a']['color'] = $value;
            }

            if ($h4_split[1] == 'breaking_bg_color') {
                $updateH4Data['.header_h4_breaking']['background-color'] = $value;
            }
        }

        return $updateH4Data;
    }

    /**
     * Header Variation One CSS Array Create
     */
    private function headerV5CssArray(array $h5Data): array
    {
        $updateH5Data = [];

        foreach ($h5Data as $key => $value) {
            $h5_split = explode('_h5_', $key);
            $value = $value . ' !important;';

            if (str_contains($h5_split[1], 'social')) {

                if ($h5_split[1] == 'social_hover_bg_color') {
                    $updateH5Data['#' . $h5_split[0] . '_h5 .widget.widget-socials.with-border li a:hover']['background-color'] = $value;
                }

                if ($h5_split[1] == 'social_bg_color') {
                    $updateH5Data['#' . $h5_split[0] . '_h5 .widget.widget-socials.with-border li a']['background-color'] = $value;
                }

                if ($h5_split[1] == 'social_hover_color') {
                    $updateH5Data['#' . $h5_split[0] . '_h5 .widget.widget-socials.with-border li a:hover']['color'] = $value;
                    $updateH5Data['#' . $h5_split[0] . '_h5 .widget.widget-socials.with-border li a:hover']['border-color'] = $value;
                }

                if ($h5_split[1] == 'social_color') {
                    $updateH5Data['#' . $h5_split[0] . '_h5 .widget.widget-socials.with-border li a']['color'] = $value;
                }
                continue;
            }

            if (str_contains($h5_split[1], 'menu')) {
                if ($h5_split[1] == 'menu_text_color') {
                    $updateH5Data['#' . $h5_split[0] . '_h5 .menu-trigger-btn']['color'] = $value;
                    $updateH5Data['#' . $h5_split[0] . '_h5 .header-right-menu ul li a']['color'] = $value;
                    $updateH5Data['#' . $h5_split[0] . '_h5 .horizontal-menu > .nav > li > a']['color'] = $value;
                    continue;
                }
                if ($h5_split[1] == 'menu_hover_text_color') {
                    $updateH5Data['#' . $h5_split[0] . '_h5 .list-has-separator > .nav > li:hover > a']['color'] = $value;
                    $updateH5Data['#' . $h5_split[0] . '_h5 .horizontal-menu > .nav li .submenu li:hover > a']['color'] = $value;
                    continue;
                }
            }

            if ($key == 'header_bottom_h5_bg_color') {
                $updateH5Data['#' . $h5_split[0] . '_h5 .h5-bg']['background-color'] = $value;
                continue;
            }

            if ($h5_split[1] == 'bg_color') {
                $updateH5Data['#' . $h5_split[0] . '_h5']['background-color'] = $value;
                continue;
            }

            if ($h5_split[1] == 'text_color') {
                $updateH5Data['#' . $h5_split[0] . '_h5 .header-nav.style--two a']['color'] = $value;
            }

            if ($h5_split[1] == 'breaking_bg_color') {
                $updateH5Data['.header_h5_breaking']['background-color'] = $value;
            }
        }

        return $updateH5Data;
    }
}
