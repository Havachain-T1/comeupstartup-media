<?php

namespace Plugin\NewslooksPageBuilder\Helpers;

use Core\Models\TlBlogTag;
use Plugin\NewslooksPageBuilder\Models\PageBuilderSectionLayoutWidgetProperties;

class BuilderWidgetHelper
{
    //------------------ Widget CSS Create Functions Start --------------------//

    // Heading Widget
    public static function heading_tag($css, $type)
    {
        $newCss = [];
        $layoutWidgetId = explode('_widget_', $type['widget_id'])[1];
        $widget_prop = PageBuilderSectionLayoutWidgetProperties::where('layout_has_widget_id', $layoutWidgetId)->first();
        $tag = $widget_prop ? $widget_prop->properties['tag'] : false;

        if ($tag) {
            $id = '#' . $type['widget_id'] . ' ' . $tag;

            foreach ($css as $key => $value) {

                if (str_contains($key, '_c_')) {

                    $property =  str_replace('_', '-', str_replace('_c_', '', $key));
                    $newCss[$id][$property] = $value . ';';
                }
            }

            return ['newCss' => $newCss, 'id' => [$id]];
        } else {

            return ['id' => []];
        }
    }

    // Image Widget
    public static function image($css, $type)
    {
        $newCss = [];
        $id = '#' . $type['widget_id'] . ' img';

        foreach ($css as $key => $value) {

            if (str_contains($key, '_c_')) {

                $property =  str_replace('_', '-', str_replace('_c_', '', $key));
                $newCss[$id][$property] = $value . 'px !important;';
            }
        }

        return [
            'newCss' => $newCss,
            'id' => [$id]
        ];
    }

    // Button Widget
    public static function button($css, $type)
    {
        $newCss = [];
        $id = '#' . $type['widget_id'] . ' a';
        $id_hover = '#' . $type['widget_id'] . ' a:hover ';

        foreach ($css as $key => $value) {

            if (str_contains($key, '_c_')) {

                $property =  str_replace('_', '-', str_replace('_c_', '', $key));

                if (str_contains($property, 'padding')) {
                    $property = str_replace('button-', '', $property);
                    $newCss[$id][$property] = $value . 'px !important;';
                    continue;
                }

                if (str_contains($property, 'hover')) {
                    $property = str_replace('hover-', '', $property);
                    $newCss[$id_hover][$property] = $value . ' !important;';
                    continue;
                }

                if (str_contains($property, 'radius') || str_contains($property, 'size')) {
                    $newCss[$id][$property] = $value . 'px !important;';
                    continue;
                }

                $newCss[$id][$property] = $value . ' !important;';
            }
        }

        return [
            'newCss' => $newCss,
            'id' => [$id, $id_hover]
        ];
    }

    // Newsletter Widget
    public static function tag($css, $type)
    {
        $newCss = [];
        $id_tag = '#' . $type['widget_id'] . ' .tagcloud a';
        $id_tag_hover = '#' . $type['widget_id'] . ' .tagcloud a:hover ';

        foreach ($css as $key => $value) {

            if (str_contains($key, '_c_')) {

                $property =  str_replace('_', '-', str_replace('_c_', '', $key));

                if (str_contains($property, 'tag')) {

                    if (str_contains($property, 'hover')) {
                        $property = str_replace('tag-hover-', '', $property);
                        $newCss[$id_tag_hover][$property] = $value . ' !important;';
                    } else {
                        $property = str_replace('tag-', '', $property);
                        $newCss[$id_tag][$property] = $value . ' !important;';
                    }

                    continue;
                }

                if (str_contains($property, 'font-size')) {
                    $newCss[$id_tag][$property] = $value . 'px !important;';
                    continue;
                }
            }
        }

        return [
            'newCss' => $newCss,
            'id' => [$id_tag, $id_tag_hover]
        ];
    }

}
