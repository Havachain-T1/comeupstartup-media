<?php

return [
    'menu_position' => [
        'Header Top Menu',
        'Header Main Menu'
    ],

    // Image Sizes
    'image_cropping_sizes' => [
        '655x670',
        '350x480',
        '255x250'
    ],

    // News looks Theme Sidebar
    'newslooks_sidebar' => [
        'post_page_sidebar',
        'single_post_sidebar',
        'footer_variation_1_sidebar',
    ],

    // News looks theme widgets
    'newslooks_widget' => [
        'author_widget',
        'social_widget',
        'search_widget',
        'advertisement_widget',
        'blog_list_widget',
        'blog_tab_widget',
        'newsletter_widget',
        'category_widget',
        'tag_widget',
        'voting_widget',
        'recent_comment_widget',
        'address_widget',
        'menu_widget',
        'gallery_widget'
    ],

    //google font api
    'google_font_api_key' => [
        'url' => 'https://www.googleapis.com/webfonts/v1/webfonts?key=' . env('GOOGLE_FONTS_API_KEY', '')
    ],

    // Blog Filter text
    'filter_text' => [
        'recent' => 'Recent Post',
        'feature' => 'Featured Post',
        'most_comment' => 'Most Commented Post',
        'most_view' => 'Most Viewed Post',
        'popular' => 'Popular Post',
    ],
];
