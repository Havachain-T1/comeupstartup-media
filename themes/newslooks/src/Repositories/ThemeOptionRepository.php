<?php

namespace Theme\NewsLooks\Repositories;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use Theme\NewsLooks\Models\ThemeOptionSettings;
use Theme\NewsLooks\Services\BackToTopService;
use Theme\NewsLooks\Services\FooterService;
use Theme\NewsLooks\Services\HeaderOptionService;
use Theme\NewsLooks\Services\Page404Service;
use Theme\NewsLooks\Services\PreloaderService;
use Theme\NewsLooks\Services\SidebarOptionService;
use Theme\NewsLooks\Services\SubscribeService;

class ThemeOptionRepository
{
    /**
     ** Saving Theme Option
     * @param object $request
     * @return void
     */
    public function saveThemeOption($request)
    {
        $active_theme = getActiveTheme();
        $data = [];
        $option_name = $request->option_name;

        foreach ($request->all() as $key => $value) {

            if (!($key == '_token' || $key == 'submitType' || $key == 'option_name')) {

                $theme_options = ThemeOptionSettings::where('option_name', $option_name)
                    ->where('theme_id', $active_theme->id)
                    ->where('field_name', $key);

                if ($theme_options->exists()) {
                    $theme_options->update([
                        'field_value' => $option_name === 'custom_scripts' ? $value : xss_clean($value)
                    ]);
                } else {
                    $option_value = [
                        'option_name' => $option_name,
                        'theme_id' => $active_theme->id,
                        'field_name' => $key,
                        'field_value' => $option_name === 'custom_scripts' ? $value : xss_clean($value),
                    ];
                    array_push($data, $option_value);
                }
            }
        };


        if (count($data) > 0) {
            ThemeOptionSettings::insert($data);
        }

        // cache clear for theme option
        Cache::forget('theme-option-settings');

        // if theme option is subscribe then updating the Mail Chimp env
        if ($option_name == 'subscribe') {
            setEnv('MAILCHIMP_APIKEY', str_replace(' ', '', $request->mailchimp_api_key));
            setEnv('MAILCHIMP_LIST_ID', str_replace(' ', '', $request->mailchimp_list_id));
        }

        // saving css file
        switch ($option_name) {
            case 'back_to_top':
                $back_to_top = getThemeOption('back_to_top', $active_theme->id);
                (new BackToTopService)->backToTopService($back_to_top);
                break;

            case 'preloader':
                $preloader = getThemeOption('preloader', $active_theme->id);
                (new PreloaderService)->preloaderService($preloader);
                break;

            case 'header':
                $header = getThemeOption('header', $active_theme->id, true);
                (new HeaderOptionService)->headerService($header);
                break;

            case 'blog':
                // Save the Text Field in Frontend Translation
                if (isset($style['read_more_text'])) {
                    storeFrontendTranslation($style['read_more_text']);
                }
                break;

            case 'single_blog_page':
                // Save the Text Field in Frontend Translation
                if (isset($request->related_section_title)) {
                    storeFrontendTranslation($request->related_section_title);
                }
                if (isset($request->popular_section_title)) {
                    storeFrontendTranslation($request->popular_section_title);
                }
                break;

            case 'sidebar_options':
                $style = getThemeOption('sidebar_options', $active_theme->id);
                (new SidebarOptionService)->setSidebarOptionStyle($style);
                break;

            case 'subscribe':
                $subscribe = getThemeOption('subscribe', $active_theme->id);
                (new SubscribeService)->setSubscribeStyle($subscribe);
                break;

            case 'footer':
                $footer = getThemeOption('footer', $active_theme->id);
                (new FooterService)->setFooterStyle($footer);
                break;

            case 'page_404':
                $page_404 = getThemeOption('page_404', $active_theme->id);
                (new Page404Service)->setPage404Style($page_404);
                break;

            case 'custom_css':
                $custom_css = $request->custom_css_code;
                $path = base_path('themes/newslooks/public/theme-option/custom_css.css');
                setFolderPermissions($path);
                file_put_contents($path, $custom_css);
                break;
        }

        cache_clear();
    }

    /**
     ** Reset Theme Option
     */
    public function resetThemeOption($request)
    {
        // all css file name
        $themeOptionCssFile = [
            'back_to_top',
            'preloader',
            'header',
            'header_logo',
            'menu',
            'mobile_menu',
            'blog',
            'sidebar_options',
            'page',
            'page_404',
            'subscribe',
            'footer',
            'custom_css'
        ];

        $active_theme = getActiveTheme();
        $options =  ThemeOptionSettings::where('theme_id', $active_theme->id);

        // reset section
        if ($request->submitType == 'reset_section') {
            $path = base_path('themes/newslooks/public/theme-option/' . $request->option_name . '.css');
            if (file_exists($path)) {
                unlink($path);
            }
            fopen($path, 'w');
            chmod($path, 0777);
            file_put_contents($path, '');
            $options = $options->where('option_name', $request->option_name);
        }

        //  reset all file
        if ($request->submitType == 'reset_all') {
            for ($i = 0; $i < sizeof($themeOptionCssFile); $i++) {
                $path = base_path('themes/newslooks/public/theme-option/' . $themeOptionCssFile[$i] . '.css');
                if (file_exists($path)) {
                    unlink($path);
                }
                fopen($path, 'w');
                chmod($path, 0777);
                file_put_contents($path, '');
            }
        }

        // update database
        $options = $options->update([
            'field_value' =>  DB::raw('field_reset_value')
        ]);
        // cache clear for theme option
        Cache::forget('theme-option-settings');
        cache_clear();
    }

    /**
     * Reset Theme Option CSS on New Import
     */
    public function resetThemeOptionOnImport()
    {
        $active_theme = getActiveTheme();

        // Back To Top CSS
        $back_to_top = getThemeOption('back_to_top', $active_theme->id);
        (new BackToTopService)->backToTopService($back_to_top);

        // Preloader CSS
        $preloader = getThemeOption('preloader', $active_theme->id);
        (new PreloaderService)->preloaderService($preloader);

        // Header CSS
        $header = getThemeOption('header', $active_theme->id);
        (new HeaderOptionService)->headerService($header);

        // Sidebar CSS
        $style = getThemeOption('sidebar_options', $active_theme->id);
        (new SidebarOptionService)->setSidebarOptionStyle($style);

        // Subscriber CSS
        $subscribe = getThemeOption('subscribe', $active_theme->id);
        (new SubscribeService)->setSubscribeStyle($subscribe);

        // Footer CSS
        $footer = getThemeOption('footer', $active_theme->id);
        (new FooterService)->setFooterStyle($footer);

        // Page 404 CSS
        $page_404 = getThemeOption('page_404', $active_theme->id);
        (new Page404Service)->setPage404Style($page_404);

        // Custom CSS
        $custom_css = getThemeOption('custom_css', $active_theme->id);
        $path = base_path('themes/newslooks/public/theme-option/custom_css.css');
        setFolderPermissions($path);
        file_put_contents($path, !empty($custom_css) ? $custom_css['custom_css_code'] : '');
    }

    /**
     **  save social link
     * @param object $request
     * @return void
     */
    public function saveSocialLink($request)
    {
        $active_theme = getActiveTheme();
        $data = [];

        // icon title
        for ($i = 0; $i < sizeof($request->social_icon_title); $i++) {
            $data[$i]['social_icon_title'] = $request->social_icon_title[$i];
        }

        // icon
        for ($i = 0; $i < sizeof($request->social_icon); $i++) {
            $data[$i]['social_icon'] = $request->social_icon[$i];
        }

        // icon url
        for ($i = 0; $i < sizeof($request->social_icon_url); $i++) {
            $data[$i]['social_icon_url'] = $request->social_icon_url[$i];
        }

        // icon color
        for ($i = 0; $i < sizeof($request->social_icon_color); $i++) {
            $data[$i]['social_icon_color'] = $request->social_icon_color[$i];
        }

        // icon top text
        for ($i = 0; $i < sizeof($request->social_icon_top); $i++) {
            $data[$i]['social_icon_top'] = $request->social_icon_top[$i];
        }

        // icon bottom text
        for ($i = 0; $i < sizeof($request->social_icon_bottom); $i++) {
            $data[$i]['social_icon_bottom'] = $request->social_icon_bottom[$i];
        }

        //order
        foreach ($data as $key => $value) {
            $data[$key]['order'] = $key + 1;
        }

        $encoded_data = json_encode($data);

        $option = ThemeOptionSettings::firstOrNew([
            'option_name' => 'social',
            'theme_id' => $active_theme->id,
            'field_name' => 'social_field'
        ]);

        $option->option_name = 'social';
        $option->theme_id = $active_theme->id;
        $option->field_name = 'social_field';
        $option->field_value = xss_clean($encoded_data);

        $option->exists ? $option->update() : $option->save();

        // cache clear for theme option
        Cache::forget('theme-option-settings');
    }


    /**
     ** Save Custom Fonts
     * @param object $request
     * @return void
     */
    public function saveCustomFont($request)
    {
        $active_theme = getActiveTheme();
        $location = 'themes/newslooks/public/';
        $font_file = ['woff', 'ttf', 'eot'];

        foreach ($request->all() as $key => $value) {
            if (str_contains($key, 'custom_font_1')) {
                $folder = 'custom_font_1';
            } elseif (str_contains($key, 'custom_font_2')) {
                $folder = 'custom_font_2';
            }

            if (str_contains($key, 'file')) {
                if ($request->hasFile($key)) {
                    $file = $request->file($key);
                    $name = $file->getClientOriginalName();
                    $path = asset($location . $folder . '/' . $name);
                    if (!file_exists($path)) {
                        $file->move($location . $folder . '/', $name);
                    }
                }
            }

            $key_array = explode('_', $key);
            $file_type = array_pop($key_array);

            if (in_array($file_type, $font_file)) {
                if ($value == '') {
                    $active_theme = getActiveTheme();
                    $name = ThemeOptionSettings::where([
                        ['theme_id', $active_theme->id],
                        ['option_name', 'custom_fonts'],
                        ['field_name', $key]
                    ])->first();
                    if ($name && $name->field_value != null) {
                        unlink($location . $folder . '/' . $name->field_value);
                    }
                }
            }
        }
        $this->saveThemeOption($request);
    }
}
