<?php

namespace Theme\NewsLooks\Services;

class PreloaderService
{

    /**
     * Set back to top style
     */
    public function preloaderService($style)
    {
        foreach ($style as $key => $value) {
            if (str_contains($key, 'transparent') && $value == 1) {
                $color = str_replace('_transparent', '', $key);
                $style[$color] = 'transparent';
            }
        }

        // Save the Text Field in Frontend Translation
        if (isset($style['preloader_text'])) {
            storeFrontendTranslation($style['preloader_text']);
        }

        $themeOption = [];
        $styleProperties = "";

        if (isset($style['preloader_field']) && $style['preloader_field'] == 1) {

            if ($style['preloader_bgcolor'] != '') {
                $themeOption['.preloader']['background-color'] = $style['preloader_bgcolor'] . " !important;";
            }

            if ($style['preloader_item_color'] != '') {
                $themeOption['.preloader-inner']['color'] = $style['preloader_item_color'] . " !important;";
            }

            $styleProperties = makeCssProperties($themeOption);
        }

        $path = base_path('themes/newslooks/public/theme-option/preloader.css');
        setFolderPermissions($path);
        file_put_contents($path, $styleProperties);
    }
}
