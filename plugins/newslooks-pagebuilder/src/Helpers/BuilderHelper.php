<?php

namespace Plugin\NewslooksPageBuilder\Helpers;

use Illuminate\Support\Facades\Cache;
use Plugin\NewslooksPageBuilder\Models\PageBuilderWidget;
use Plugin\NewslooksPageBuilder\Models\PageBuilderSection;

class BuilderHelper
{

    public static $widget_list = [
        'header',
        'footer',
        'heading_tag',
        'text_editor',
        'image',
        'button',
        'ads',
        'author',
        'category',
        'tag',
        'newsletter',
        'contact',
        'social',
        'search',
        'post_filter',
        'post_list',
        'post_tab',
        'voting',
        'recent_comments',
        'address',
        'menu_links',
        'gallery_post',
        'slider_post',
        'video_post',
        'post_layout',
        'post_advance_layout'
    ];

    public static $preview_url = '/admin/page-preview?page=';

    /**
     * get page builder widgets
     * @return object $widgets
     */
    public static function getPageBuilderWidgets()
    {
        $active_theme = getActiveTheme();

        $all_settings_name = self::$widget_list;

        $widgets = [];

        if ($all_settings_name) {
            foreach ($all_settings_name as $value) {
                $full_name = ucwords(str_replace('_', ' ', $value));
                $widget = PageBuilderWidget::firstOrCreate([
                    'name' => $value,
                    'full_name' => $full_name,
                    'theme_id' => $active_theme->id
                ]);
                $widgets[] = $widget->toArray();
            }
        }

        return $widgets;
    }

    /**
     * Get Page Section Layouts with widgets 
     */
    public static function getSectionLayoutWidgets($page, $lang)
    {
        $active_theme = getActiveTheme();

        $page_section_layout_widgets =  Cache::remember("page_builder_data_{$page}_{$lang}", 3600, function () use ($page, $active_theme, $lang) {

            $data =  PageBuilderSection::with(['layouts.layout_widgets' => function ($query) {
                $query->with('widget')->with('properties');
            }])
                ->with('properties')
                ->where([
                    'page_id' => $page,
                    'theme_id' => $active_theme->id,
                ])
                ->orderBy('ordering')
                ->get()
                ->map(function ($page_section) use ($lang) {
                    foreach ($page_section->layouts as $layouts) {
                        foreach ($layouts->layout_widgets as $widgets) {
                            if ($widgets->properties != null) {
                                $widgets->properties->properties = json_encode($widgets->properties->propertiesTranslations($lang));
                            }
                        }
                    }
                    return $page_section;
                })
                ->toArray();

            return $data;
        });


        return $page_section_layout_widgets;
    }

    /**
     * Return a Json Response with code
     */
    public static function jsonResponse($status, $msg, $data = '')
    {
        return response()->json([
            'message' => $msg,
            'data'    => $data
        ], $status);
    }

    /**
     * Delete CSS and Json File on Page Delete
     */
    public static function deleteBuilderCssOnPageDelete($page_id)
    {
        $active_theme = getActiveTheme();
        $css_path = base_path("themes/{$active_theme->location}/public/builder-assets/css/{$page_id}.css");
        $json_path = base_path("themes/{$active_theme->location}/public/builder-assets/css/{$page_id}.json");

        if (file_exists($css_path)) {
            unlink($css_path);
        }

        if (file_exists($json_path)) {
            unlink($json_path);
        }
    }

    /**
     * Widget Specific Class
     */
    public static function getWidgetClass($widget_name)
    {
        switch ($widget_name) {
            case 'author':
                $widget_specific_class = 'widget_about_me';
                break;

            case 'category':
                $widget_specific_class = 'widget_post_categories border-style';
                break;

            case 'tag':
                $widget_specific_class = 'widget_tags border-style';
                break;

            case 'social':
                $widget_specific_class = 'widget_social_media_info';
                break;

            case 'search':
                $widget_specific_class = 'widget_search';
                break;

            case 'post_list':
                $widget_specific_class = 'widget-blog-list';
                break;

            case 'post_tab':
                $widget_specific_class = 'widget_post_tab';
                break;

            case 'address':
                $widget_specific_class = 'widget_about';
                break;

            case 'newsletter':
                $widget_specific_class = 'widget_newsletter c2-bg bg-cover text-center';
                break;

            case 'recent_comments':
                $widget_specific_class = 'widget_recent_comments';
                break;

            case 'gallery_post':
                $widget_specific_class = 'widget_gallery';
                break;

            case 'voting':
                $widget_specific_class = 'widget-voting';
                break;

            default:
                $widget_specific_class = '';
                break;
        }

        return $widget_specific_class;
    }
}
