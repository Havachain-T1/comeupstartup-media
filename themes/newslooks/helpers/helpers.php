<?php

use Core\Models\TlBlog;
use Core\Models\Language;
use Core\Models\TlBlogTag;
use Core\Models\TlBlogCategory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Theme\NewsLooks\Models\Widget;
use Core\Repositories\BlogRepository;
use Core\Repositories\MenuRepository;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Session;
use Theme\NewsLooks\Models\SidebarHasWidget;
use Theme\NewsLooks\Models\ThemeSidebar;
use Theme\NewsLooks\Models\ThemeOptionSettings;
use Theme\NewsLooks\Models\SidebarWidgetHasValue;

if (!function_exists('getMenuStructureByGroupId')) {
    /**
     * get menu structure by group id
     * @return mixed|array
     */
    function getMenuStructureByGroupId($group_id)
    {
        $placeholder_image = getPlaceHolderImage();
        $menu_info = [
            'tl_menus.id',
            'tl_menus.parent_id',
            'tl_menus.level',
            'tl_menus.title',
            'tl_menus.url',
            'tl_menus.url as preview_url',
            'tl_menus.icon',

            'tl_menus.menu_type_id',
            'tl_menus.menu_type',

            'tl_uploaded_files.path as path',
            'tl_uploaded_files.alt as alt',

            'tl_menu_groups.name as group_name'
        ];

        $match_case = [['tl_menu_groups.id', '=', $group_id]];

        $data = DB::table('tl_menus')
            ->join('tl_menu_groups', 'tl_menu_groups.id', '=', 'tl_menus.menu_group_id')
            ->leftJoin('tl_uploaded_files', 'tl_uploaded_files.id', '=', 'tl_menus.icon')
            ->orderBy('index')
            ->orderBy('level')
            ->where($match_case)
            ->select($menu_info)->get();

        for ($i = 0; $i < sizeof($data); $i++) {
            $data[$i]->index = $i;

            if ($data[$i]->icon == null || $data[$i]->icon == 'null' || $data[$i]->icon == '' ||  $data[$i]->icon == ' ') {
                $data[$i]->path = $placeholder_image->placeholder_image;
                $data[$i]->alt = $placeholder_image->placeholder_image_alt;
                $translated_title = getTranslatedMenuTitle($data[$i]->id, getFrontLocale(), $data[$i]->title);
                $data[$i]->title = $translated_title;
            } else {
                $data[$i]->alt = $data[$i]->title;
            }
            if ($data[$i]->menu_type_id != null) {
                $data[$i]->preview_url = URL::to($data[$i]->url);
            }
        }

        $final_data = [];
        $pushed_menu_id = [];
        $menu_repo = new MenuRepository();

        for ($i = 0; $i < sizeof($data); $i++) {
            if (!in_array($data[$i]->id, $pushed_menu_id)) {
                array_push($final_data, $data[$i]);
                array_push($pushed_menu_id, $data[$i]->id);
                $final_data = $menu_repo->getChildMenus($data[$i]->id, $data, $final_data);
            }
        }

        return $final_data;
    }
}

if (!function_exists('commentClose')) {

    /**
     ** Comment Should be Close or not 
     * @return boolean
     */
    function commentClose($publish_at)
    {
        $commentSettings = commentFormSettings();
        $comment_close_date = date('Y-m-d', strtotime($publish_at . ' + ' . $commentSettings['close_comments_days_old'] . ' days'));
        $comment_close = currentDateTime() > $comment_close_date ? true : false;
        return $comment_close;
    }
}

if (!function_exists('getThemeOption')) {
    /**
     * get theme option of specific field
     * @return mixed|array
     */
    function getThemeOption($option_name, $active_theme_id)
    {
        $options = Cache::rememberForever('theme-option-settings', function () use ($active_theme_id) {
            return DB::table('tl_theme_option_settings')
                ->where('theme_id', $active_theme_id)
                ->select([
                    'tl_theme_option_settings.option_name',
                    'tl_theme_option_settings.field_name',
                    'tl_theme_option_settings.field_value'
                ])
                ->get();
        });

        $update_options = [];
        foreach ($options as $key => $value) {
            $update_options[$value->option_name][$value->field_name] = $value->field_value;
        }

        if (isset($option_name) && isset($update_options[$option_name])) {
            return $update_options[$option_name];
        } else {
            return [];
        }
    }
}

if (!function_exists('getAllFonts')) {
    /**
     * get all font family,variants and subsets from google api
     * @return mixed|array
     */
    function getAllFonts()
    {
        $url = config('newslooks.google_font_api_key.url');
        $json = file_get_contents($url);
        $json_data = json_decode($json, true);

        $data = [];

        for ($i = 0; $i < sizeof($json_data['items']); $i++) {
            $item = $json_data['items'][$i];

            $data[$i]['family'] = $item['family'];
            $data[$i]['variants'] = json_encode($item['variants']);
            $data[$i]['subsets'] = json_encode($item['subsets']);
        }

        return $data;
    }
}

if (!function_exists('themeOptionToCss')) {
    /**
     * get theme options and make css
     * @return mixed|array
     */
    function themeOptionToCss($option_name, $active_theme_id)
    {
        $options = getThemeOption($option_name, $active_theme_id);
        $mainCss = [];

        foreach ($options as $key => $value) {
            $splitted_key = explode('_', $key);
            $property = array_pop($splitted_key);
            $section = join('_', $splitted_key);

            //ignore key
            if ($property === 'i') {
                continue;
            } elseif ($property === 's') {
                $mainCss['static'][$key] = $value;
                continue;
            } elseif ($property === 'c') {
                $mainCss['condition'][$key] = $value;
                continue;
            } else {
                if ($value != '') {
                    if (str_contains($section, '_u')) {
                        $splitted_section_name_array = explode('_', $section);
                        array_pop($splitted_section_name_array);
                        $section = join('_', $splitted_section_name_array);
                        $value = $value . $options[$section . '_unit_i'];
                    } else {
                        if ($property === 'color' || $property === 'background-color') {
                            if (isset($options[$key . "-transparent_i"])  && $options[$key . "-transparent_i"] == 1) {
                                $value = 'transparent';
                            }
                        }
                    }
                } else {
                    continue;
                }
                if ($property == 'font-family' && str_contains($value, 'custom')) {
                    $font_face_value = createFontFace($value);
                    if (!empty($font_face_value)) {
                        $mainCss['css']['@font-face-' . $section] = $font_face_value;
                    }
                }
                $mainCss['css'][$section][$property] = $value;
            }
        }
        return $mainCss;
    }
}

if (!function_exists('createFontFace')) {
    /**
     * creating font face
     * @param $font_family font family
     * @return mixed|string
     */
    function createFontFace($font_family)
    {
        $family_split = explode(',', $font_family);
        $custom_font_number = str_replace('-', '_', $family_split[0]);

        $active_theme = getActiveTheme();
        $custom_options = getThemeOption('custom_fonts', $active_theme->id);

        $customFontFace = [];
        if ($custom_options[$custom_font_number] == '1') {
            $customFontFace['font-family'] = $family_split[0];
            $font_woff_file = $custom_options[$custom_font_number . '_woff'];
            $font_ttf_file = $custom_options[$custom_font_number . '_ttf'];
            $font_eot_file = $custom_options[$custom_font_number . '_eot'];

            if ($font_woff_file != '') {
                if (isset($customFontFace['src']) && $customFontFace['src'] != '') {
                    $customFontFace['src'] = $customFontFace['src'] . ',' . "url('" . asset('themes/newslooks/public/assets/' . $custom_font_number . '/' . $font_woff_file) . "')";
                } else {
                    $customFontFace['src'] = "url('" . asset('themes/newslooks/public/assets/' . $custom_font_number . '/' . $font_woff_file) . "')";
                }
            }

            if ($font_ttf_file != '') {
                if (isset($customFontFace['src']) && $customFontFace['src'] != '') {
                    $customFontFace['src'] = $customFontFace['src'] . ',' . "url('" . asset('themes/newslooks/public/assets/' . $custom_font_number . '/' . $font_ttf_file) . "')";
                } else {
                    $customFontFace['src'] = "url('" . asset('themes/newslooks/public/assets/' . $custom_font_number . '/' . $font_ttf_file) . "')";
                }
            }

            if ($font_eot_file != '') {
                if (isset($customFontFace['src']) && $customFontFace['src'] != '') {
                    $customFontFace['src'] = $customFontFace['src'] . ',' . "url('" . asset('themes/newslooks/public/assets/' . $custom_font_number . '/' . $font_eot_file) . "')";
                } else {
                    $customFontFace['src'] = "url('" . asset('themes/newslooks/public/assets/' . $custom_font_number . '/' . $font_eot_file) . "')";
                }
            }
        }
        return $customFontFace;
    }
}

if (!function_exists('getThemeWidgetId')) {
    /**
     * Get theme widget id
     *
     * @param String $widget_name
     * @return mixed
     */
    function getThemeWidgetId($widget_name)
    {
        $active_theme = getActiveTheme();
        $name = ucwords(str_replace('_', ' ', $widget_name));
        $widget = Widget::firstOrCreate(['widget_name' => $name, 'theme_id' => $active_theme->id]);
        if ($widget != null) {
            return $widget->id;
        }
        return null;
    }
}

if (!function_exists('getThemeWidgetName')) {
    /**
     * Get theme widget name
     *
     * @param int $widget_id
     * @return mixed
     */
    function getThemeWidgetName($widget_id)
    {
        $active_theme = getActiveTheme();
        $widget = Widget::where(['id' => $widget_id, 'theme_id' => $active_theme->id])->first();
        if ($widget != null) {
            $name = str_replace(' ', '_', strtolower($widget->widget_name));
            return $name;
        }
        return null;
    }
}

if (!function_exists('getThemeWidgetNameAsArray')) {
    /**
     * Get theme widget name as array
     *
     * @param String $theme_widget_names
     * @return mixed
     */
    function getThemeWidgetNameAsArray($theme_widget_names)
    {
        $all_settings_name = config('newslooks.' . $theme_widget_names);
        $names = [];
        $ids = [];
        for ($i = 0; $i < sizeof($all_settings_name); $i++) {
            $ids[$i] = getThemeWidgetId($all_settings_name[$i]);
            $names[$i] = $all_settings_name[$i];
        }
        return $names;
    }
}

if (!function_exists('getThemeSidebarId')) {
    /**
     * Get theme sidebar id
     *
     * @param String $sidebar_name
     * @return mixed
     */
    function getThemeSidebarId($sidebar_name)
    {
        $active_theme = getActiveTheme();
        $name = ucwords(str_replace('_', ' ', $sidebar_name));
        $sidebar = ThemeSidebar::firstOrCreate(['sidebar_name' => $name, 'theme_id' => $active_theme->id]);
        if ($sidebar != null) {
            return $sidebar->id;
        }
        return null;
    }
}

if (!function_exists('getThemeSidebarNameAsArray')) {
    /**
     * Get theme widget name as array
     *
     * @param String $theme_widget_names
     * @return mixed
     */
    function getThemeSidebarNameAsArray($theme_sidebar_names)
    {
        $all_settings_name = config('newslooks.' . $theme_sidebar_names);
        $names = [];
        $ids = [];
        for ($i = 0; $i < sizeof($all_settings_name); $i++) {
            $ids[$i] = getThemeSidebarId($all_settings_name[$i]);
            $names[$i] = $all_settings_name[$i];
        }
        return $names;
    }
}

if (!function_exists('getAllSidebarWidgetValues')) {
    /**
     * get all the widget of a sidebar
     * @return mixed|array
     */
    function getAllSidebarWidgetValuesFrontend($sidebar_id)
    {

        $widget_values = SidebarHasWidget::with(['widget:id,widget_name', 'sidebarWidgetValue:id,sidebar_has_widget_id,value'])
            ->where('sidebar_id', $sidebar_id)
            ->orderBy('order')
            ->get()
            ->map(function ($sidebar_widget) {
                $sidebar_widget->widget_name = $sidebar_widget->widget->widget_name;
                unset($sidebar_widget->widget);

                $sidebar_widget->widget_value = [];

                if ($sidebar_widget->sidebarWidgetValue != null) {
                    $sidebar_widget->widget_value = $sidebar_widget->sidebarWidgetValue->widgetValueTranslation(getFrontLocale());
                }
                unset($sidebar_widget->sidebarWidgetValue);

                return $sidebar_widget;
            })
            ->toArray();

        return $widget_values;
    }
}

if (!function_exists('getAllSidebarWidgets')) {
    /**
     * get all the widget of a sidebar
     * @return mixed|array
     */
    function getAllSidebarWidgets($sidebar_id)
    {
        $widgets = DB::table('tl_sidebar_has_widgets')
            ->join('tl_widgets', 'tl_widgets.id', '=', 'tl_sidebar_has_widgets.widget_id')
            ->where('tl_sidebar_has_widgets.sidebar_id', '=', $sidebar_id)
            ->select(
                'tl_sidebar_has_widgets.id as sidebar_has_widget_id',
                'tl_widgets.id as widget_id',
                'tl_widgets.widget_name',
            )
            ->orderBy('tl_sidebar_has_widgets.order', 'asc')
            ->get();

        return $widgets;
    }
}

if (!function_exists('getSidebarWidgetValues')) {
    /**
     * Will return values for widgets in sidebar
     * @param Int $sidebar_has_widget_id
     * @return String
     */
    function getSidebarWidgetValues($sidebar_has_widget_id, $lang)
    {
        $sidebar_widget_value = SidebarWidgetHasValue::where('sidebar_has_widget_id', $sidebar_has_widget_id)->first();
        $value = null;
        if ($sidebar_widget_value != null) {
            $translated_value = $sidebar_widget_value->translation('value', $lang);
            if ($sidebar_widget_value->value != null) {
                $value = array_replace(json_decode($sidebar_widget_value->value, true), json_decode($translated_value, true));
            } else {
                $value = json_decode($translated_value, true);
            }
        }
        return $value;
    }
}

if (!function_exists('makeCssProperties')) {
    /**
     * make array to css
     * @param array $themeOption
     * @return string
     */
    function makeCssProperties($themeOption)
    {
        $pre_style = substr(json_encode($themeOption), 1, -1);
        $after_removing_quote = str_replace('"', '', $pre_style);
        $after_removing_colon = str_replace(':{', '{' . "\n", $after_removing_quote);
        $after_removing_comma = str_replace('},', '}' . "\n", $after_removing_colon);
        $after_removing_comma_inside_css = str_replace(';,', ';' . "\n", $after_removing_comma);
        $after_adding_newline = str_replace(';}', ';' . "\n" . '}', $after_removing_comma_inside_css);
        $all_fontface = [
            '@font-face-body_font',
            '@font-face-paragraph_font',
            '@font-face-all_heading_font',
            '@font-face-h1_heading_font',
            '@font-face-h2_heading_font',
            '@font-face-h3_heading_font',
            '@font-face-h4_heading_font',
            '@font-face-h5_heading_font',
            '@font-face-h6_heading_font',
            '@font-face-menu_font',
            '@font-face-sub_menu_font',
            '@font-face-button_font',
            '@font-face-widget_title_font',
            '@font-face-page_title_font',
        ];
        $after_modify_fontface = str_replace($all_fontface, '@font-face', $after_adding_newline);

        return $after_modify_fontface;
    }
}

if (!function_exists('setFolderPermissions')) {
    /**
     * set folder permissions
     * @return string
     */
    function setFolderPermissions($path)
    {
        if (file_exists($path)) {
            unlink($path);
        }
        fopen($path, 'w');
        chmod($path, 0777);
    }
}

if (!function_exists('getJsonThemeOption')) {
    /**
     * get theme options json data
     * @return JSON
     * 
     */
    function getJsonThemeOption($file = false)
    {
        $active_theme = getActiveTheme();
        $data = ThemeOptionSettings::where('theme_id', $active_theme->id)->get();
        if (!$file) {
            return $data->toJson();
        }
        $filename = 'theme_option.json';

        $headers = [
            'Content-Type' => 'application/json',
            'Content-Disposition' => 'attachment; filename="' . $filename . '"',
        ];

        return response()->json($data, 200, $headers);
    }
}

if (!function_exists('getFrontLocale')) {
    /**
     * get the frontend local lang
     *
     * @return String
     */

    function getFrontLocale()
    {
        $locale = getDefaultLang();
        if (Session::has('api_locale')) {
            $locale = Session::get('api_locale');
        }
        return $locale;
    }
}

if (!function_exists('getActiveFrontLangRTL')) {
    /**
     * get the frontend local lang
     *
     * @return String
     */

    function getActiveFrontLangRTL()
    {
        if (Session::has('front-rtl')) {
            return Session::get('front-rtl') == 1;
        } else {

            $lang = Language::where('code', getFrontLocale())->first();
            $rtl = $lang->is_rtl == config('settings.general_status.active') ? 1 : 0;

            Session::put('front-rtl', $rtl);

            return $lang->is_rtl == config('settings.general_status.active');
        }
    }
}

if (!function_exists('blogFilterSeo')) {
    /**
     * Blog Filter Seo
     *@param string $filter
     *@param string $permalink
     * @return array
     */

    function blogFilterSeo($typeData)
    {
        $seo = [];
        $seo['site_meta_title'] = $typeData->meta_title;
        $seo['site_meta_description'] = $typeData->meta_description;
        $seo['site_meta_image'] = $typeData->meta_image;
        $seo['filter_name'] = $typeData->translation('name', getFrontLocale());

        return $seo;
    }
}

if (!function_exists('findAdsense')) {
    /**
     * find adsense
     * @return mixed
     */

    function findAdsense($id, $adsense_list)
    {
        foreach ($adsense_list as $element) {
            if ($element['adsense_index'] == $id) {
                return $element['adsense_code'];
            }
        }
        return false;
    }
}
