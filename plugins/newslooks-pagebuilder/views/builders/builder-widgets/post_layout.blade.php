@php
    $blog_options = getThemeOption('blog', $active_theme->id);

    $read_more = front_translate('Read More');
    if (isset($blog_options['read_more_text_setting']) && $blog_options['read_more_text_setting'] == 'custom') {
        $read_more = isset($blog_options['read_more_text']) ? front_translate($blog_options['read_more_text']) : '';
    }

    $blog_excerpt = isset($blog_options['blog_posts_excerpt']) && !empty($blog_options['blog_posts_excerpt']) ? $blog_options['blog_posts_excerpt'] : 50;

    $count = isset($data['count']) ? $data['count'] : null;
    $type = isset($data['type']) ? $data['type'] : null;

    $category_id = $type == 'category' ? $data['category'] : null;

    if (isset($category_id)) {
        $category = Core\Models\TlBlogCategory::where('id', $data['category'])
            ->select(['id', 'permalink'])
            ->first();
        $category_id = $category ? $category->id : null;
    }

    $column_lg = isset($data['post_column_lg']) ? $data['post_column_lg'] : 'col-lg-3';
    $column_md = isset($data['post_column_md']) ? $data['post_column_md'] : 'col-sm-2';
    $column_sm = isset($data['post_column_sm']) ? $data['post_column_sm'] : 'col-1';

    $post_style = isset($data['post_style']) ? $data['post_style'] : 'style_1';

    $blogs = BlogHelper::filterBlogs($type, $count, $category_id);
@endphp

<div class="post_layout">
    @isset($data['title_t_'])
        <div class="row align-items-center">
            <div class="col">
                <!-- Section Title -->
                <div class="section-title has-bg-shape shape--two mb-30">
                    <h2 class="c1">{{ $data['title_t_'] }}</h2>
                </div>
                <!-- End Section Title -->
            </div>

            <div class="col-auto">
                <div class="d-flex align-items-center justify-content-end mb-30">

                    <a href="{{ isset($category_id) ? route('theme.newslooks.blog.blogByCategory', $category->permalink) : route('theme.newslooks.blog.blogByFilter', $type) }}"
                        class="square-btn d-inline-flex align-items-center justify-content-center" aria-label="filter">
                        <svg xmlns="http://www.w3.org/2000/svg" width="8" height="10" viewBox="0 0 3.683 6.82"
                            class="svg replaced-svg">
                            <path
                                d="M121.348,3.223,118.193.077a.264.264,0,0,0-.373.374l2.967,2.958L117.82,6.368a.264.264,0,0,0,.373.374L121.348,3.6a.264.264,0,0,0,0-.374Z"
                                transform="translate(-117.742 0)" fill="currentColor"></path>
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    @endisset

    <div class="post--items position-relative" id="post_hot_topics">
        <div class="row">
            @foreach ($blogs as $blog)
                <div class="{{ $column_sm . ' ' . $column_md . ' ' . $column_lg }}">
                    @includeIf('theme/newslooks::frontend.includes.post-styles.' . $post_style, [
                        'blog' => $blog,
                        'read_more' => $read_more,
                        'blog_excerpt' => $blog_excerpt,
                    ])
                </div>
            @endforeach
        </div>
    </div>
</div>
