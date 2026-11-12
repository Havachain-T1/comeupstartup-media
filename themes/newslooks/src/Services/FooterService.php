<?php

namespace Theme\NewsLooks\Services;

class FooterService
{
    /**
     * Footer Theme Option CSS
     */
    public function setFooterStyle($style)
    {
        // Save the Text Field in Frontend Translation
        if (isset($style['footer_2_middle_text'])) {
            storeFrontendTranslation($style['footer_2_middle_text']);
        }

        $updateStyle = [];
        foreach ($style as $key => $value) {

            if (str_contains($key, 'transparent')) {
                $color = str_replace('_transparent', '', $key);
                $style[$color] = $value == 1 ? 'transparent' : $style[$color];
                unset($style[$key]);
                continue;
            }

            if (empty($value)) {
                continue;
            }

            if (str_contains($key, 'footer_1')) {
                $updateStyle['footer_1'][$key] = $value;
            }

            if (str_contains($key, 'footer_2')) {
                $updateStyle['footer_2'][$key] = $value;
            }
        }

        $themeOption = [];
        $styleProperties = "";

        foreach ($updateStyle as $key => $value) {
            switch ($key) {
                case 'footer_1':
                    $f1Data = $this->footerV1CssArray($value);
                    $themeOption += $f1Data;
                    break;

                case 'footer_2':
                    $f2Data = $this->footerV2CssArray($value);
                    $themeOption += $f2Data;
                    break;
            }
        }

        $styleProperties = makeCssProperties($themeOption);
        $path = base_path('themes/newslooks/public/theme-option/footer.css');
        setFolderPermissions($path);
        file_put_contents($path, $styleProperties);
    }

    /**
     * Footer Version 1 CSS
     */
    private function footerV1CssArray(array $f1Data): array
    {
        $updateF1Data = [];

        foreach ($f1Data as $key => $value) {
            $value = $value . ' !important;';

            if ($key == 'footer_1_newsletter_bg_color') {
                $updateF1Data['#footer_1_newsletter']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_1_newsletter_button_bg_color') {
                $updateF1Data['#footer_1_newsletter .newsletter-form button']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_1_newsletter_button_text_color') {
                $updateF1Data['#footer_1_newsletter .newsletter-form button']['color'] = $value;
                continue;
            }

            if ($key == 'footer_1_newsletter_social_color') {
                $updateF1Data['#footer_1_newsletter .widget.widget-socials li a .fa']['color'] = $value;
                continue;
            }

            if ($key == 'footer_1_newsletter_social_bg_color') {
                $updateF1Data['#footer_1_newsletter .widget.widget-socials li a']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_1_newsletter_social_hover_color') {
                $updateF1Data['#footer_1_newsletter .widget.widget-socials li a:hover .fa']['color'] = $value;
                continue;
            }

            if ($key == 'footer_1_newsletter_social_hover_bg_color') {
                $updateF1Data['#footer_1_newsletter .widget.widget-socials li a:hover']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_1_widget_bg_color') {
                $updateF1Data['#footer_1_widget']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_1_widget_title_color') {
                $updateF1Data['#footer_1_widget .widget .widget-title']['color'] = $value;
                $updateF1Data['#footer_1_widget .widget .section-title.has-bg-shape.shape--two h2']['color'] = $value;
                continue;
            }

            if ($key == 'footer_1_widget_text_color') {
                $updateF1Data['#footer_1_widget p, #footer_1_widget span, #footer_1_widget a']['color'] = $value;
                continue;
            }

            if ($key == 'footer_1_widget_anchor_hover_color') {
                $updateF1Data['#footer_1_widget a:hover']['color'] = $value;
                continue;
            }

            if ($key == 'footer_1_widget_title_after_color') {
                $updateF1Data['#footer_1_widget .section-title.has-bg-shape h2:after']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_1_bottom_bg_color') {
                $updateF1Data['#footer_1_bottom']['background-color'] = $value;
                continue;
            }
        }

        return $updateF1Data;
    }

    /**
     * Footer Version 2 CSS
     */
    private function footerV2CssArray(array $f2Data): array
    {
        $updateF2Data = [];

        foreach ($f2Data as $key => $value) {
            $value = $value . ' !important;';

            if ($key == 'footer_2_middle_bg_color') {
                $updateF2Data['#footer_2_middle']['background-color'] = $value;
                continue;
            }


            if ($key == 'footer_2_middle_text_color') {
                $updateF2Data['#footer_2_middle p']['color'] = $value;
                continue;
            }

            if ($key == 'footer_2_middle_social_color') {
                $updateF2Data['#footer_2_middle .widget.widget-socials.with-border li a .fa']['color'] = $value;
                continue;
            }

            if ($key == 'footer_2_middle_social_bg_color') {
                $updateF2Data['#footer_2_middle .widget.widget-socials.with-border li a']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_2_middle_social_hover_color') {
                $updateF2Data['#footer_2_middle .widget.widget-socials.with-border li a:hover .fa']['color'] = $value;
                continue;
            }

            if ($key == 'footer_2_middle_social_hover_bg_color') {
                $updateF2Data['#footer_2_middle .widget.widget-socials.with-border li a:hover']['background-color'] = $value;
                continue;
            }

            if ($key == 'footer_2_bottom_bg_color') {
                $updateF2Data['#footer_2_bottom']['background-color'] = $value;
                continue;
            }
        }

        return $updateF2Data;
    }
}
