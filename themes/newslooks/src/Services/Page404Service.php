<?php

namespace Theme\NewsLooks\Services;

class Page404Service
{

    /**
     * Set back to top style
     */
    public function setPage404Style($style)
    {
        foreach ($style as $key => $value) {
            if (str_contains($key, 'transparent')) {
                if($value == 1){
                    $color = str_replace('_transparent', '', $key);
                    $style[$color] = 'transparent';
                }
                unset($style[$key]);
            }
        }

        // Save the Text Field in Frontend Translation
        if (isset($style['page_404_title'])) {
            storeFrontendTranslation($style['page_404_title']);
        }

        if (isset($style['page_404_subtitle'])) {
            storeFrontendTranslation($style['page_404_subtitle']);
        }

        if (isset($style['page_404_button_text'])) {
            storeFrontendTranslation($style['page_404_button_text']);
        }

        $themeOption = [];
        $styleProperties = "";

        if (isset($style['custom_404_page']) && $style['custom_404_page'] == 1) {

            if ($style['page_404_bg_color'] != '') {
                $themeOption['.content-404 .btn']['background-color'] = $style['page_404_bg_color'] . " !important;";
            }

            if ($style['page_404_text_color'] != '') {
                $themeOption['.content-404 .btn']['color'] = $style['page_404_text_color'] . " !important;";
                $themeOption['.content-404 .btn:hover']['color'] = $style['page_404_text_color'] . " !important;";
            }

            $styleProperties = makeCssProperties($themeOption);
        }

        $path = base_path('themes/newslooks/public/theme-option/page_404.css');
        setFolderPermissions($path);
        file_put_contents($path, $styleProperties);
    }
}
