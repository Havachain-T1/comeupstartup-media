<?php

namespace Theme\NewsLooks\Services;

class BackToTopService
{

    /**
     * Set back to top style
     */
    public function backToTopService($style)
    {
        foreach ($style as $key => $value) {
            if (str_contains($key, 'transparent') && $value == 1) {
                $color = str_replace('_transparent', '', $key);
                $style[$color] = 'transparent';
            }
        }
        
        $themeOption = [];
        $styleProperties = "";

        if (isset($style['back_to_top_button']) && $style['back_to_top_button'] == 1 && isset($style['custom_back_to_top_button']) && $style['custom_back_to_top_button'] == 1) {
            foreach ($style as $key => $value) {
                if ($key == 'back_to_top_button_bgcolor' && $value != "") {
                    $themeOption['button.back-to-top.c1-bg']['background-color'] = $value . "!important;";
                }
                if ($key == 'back_to_top_button_color' && $value != "") {
                    $themeOption['button.back-to-top']['color'] = $value . "!important;";
                }

                if ($key == 'back_to_top_button_on_mobile' && $value == 0) {
                    $themeOption['@media (max-width:575px)']['button.back-to-top']['display'] = 'none !important;';
                }
            }
            $styleProperties = makeCssProperties($themeOption);
        }

        $path = base_path('themes/newslooks/public/theme-option/back_to_top.css');
        setFolderPermissions($path);
        file_put_contents($path, $styleProperties);
    }



}