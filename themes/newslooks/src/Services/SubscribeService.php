<?php

namespace Theme\NewsLooks\Services;

class SubscribeService
{

    /**
     * Set back to top style
     */
    public function setSubscribeStyle($style)
    {
        foreach ($style as $key => $value) {
            if (str_contains($key, 'transparent') && $value == 1) {
                $color = str_replace('_transparent', '', $key);
                $style[$color] = 'transparent';
            }
        }

        $themeOption = [];
        $styleProperties = "";

        if (isset($style['custom_footer_subscribe']) && $style['custom_footer_subscribe'] == 1) {

            if ($style['newsletter_title_color'] != '') {
                $themeOption['.aside .newsletter-title h3']['color'] = $style['newsletter_title_color'] . " !important;";
            }

            if ($style['newsletter_subtitle_color'] != '') {
                $themeOption['.aside .newsletter-title p']['color'] = $style['newsletter_subtitle_color'] . " !important;";
            }

            if ($style['newsletter_button_color'] != '') {
                $themeOption['.aside .widget_newsletter .btn']['color'] = $style['newsletter_button_color'] . " !important;";
            }

            if (!empty($style['newsletter_bg_image'])) {
                $themeOption['.aside .widget_newsletter']['background-image'] = "url('" . getFilePath($style['newsletter_bg_image']) . "')" . " !important;";
            }

            $styleProperties = makeCssProperties($themeOption);
        }

        $path = base_path('themes/newslooks/public/theme-option/subscribe.css');
        setFolderPermissions($path);
        file_put_contents($path, $styleProperties);
    }
}
