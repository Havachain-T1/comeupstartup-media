<?php

namespace Theme\NewsLooks\Services;


class SidebarOptionService
{

    /**
     * Set Sidebar Option Style
     */
    public function setSidebarOptionStyle($style)
    {
        foreach ($style as $key => $value) {
            if (str_contains($key, 'transparent')) {
                if ($value == 1) {
                    $color = str_replace('_transparent', '', $key);
                    $style[$color] = 'transparent';
                }
                unset($style[$key]);
            }
        }

        $themeOption = [];
        $styleProperties = "";

        if (isset($style['custom_sidebar']) && $style['custom_sidebar'] == 1) {

            foreach ($style as $key => $value) {

                if($key == 'widget_background_color'){
                    $themeOption['.aside .widget']['background-color'] = $value . ' !important;';
                }
                
                if(str_contains($key, 'margin') &&  $key != 'widget_margin_unit'){
                    $property = str_replace('widget-', '', str_replace('_', '-', $key));
                    $themeOption['.aside .widget'][$property] = $value . $style['widget_margin_unit'] . ' !important;';
                }

                if(str_contains($key, 'padding') &&  $key != 'widget_padding_unit'){
                    $property = str_replace('widget-', '', str_replace('_', '-', $key));
                    $themeOption['.aside .widget'][$property] = $value . $style['widget_padding_unit'] . ' !important;';
                }

                if($key == 'widget_title_color'){
                    $themeOption['.aside .widget .section-title.has-bg-shape.shape--two h2']['color'] = $value . ' !important;';
                }

                if($key == 'widget_title_after_color'){
                    $themeOption['.aside .widget .section-title.has-bg-shape.shape--two h2:after']['background-color'] = $value . ' !important;';
                }
            }

            $styleProperties = makeCssProperties($themeOption);
        }

        $path = base_path('themes/newslooks/public/theme-option/sidebar_options.css');
        setFolderPermissions($path);
        file_put_contents($path, $styleProperties);
    }

}