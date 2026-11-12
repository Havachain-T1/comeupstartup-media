@php
    $count = isset($data['count']) ? $data['count'] : null;
    $type = isset($data['type']) ? $data['type'] : null;

    $category_id = $type == 'category' ? $data['category'] : null;

    if (isset($category_id)) {
        $category = Core\Models\TlBlogCategory::where('id', $data['category'])
            ->select(['id', 'permalink'])
            ->first();
        $category_id = $category ? $category->id : null;
    }

    $post_style = isset($data['post_advance_style']) ? $data['post_advance_style'] : 'advance_layout_1';

    $blogs = BlogHelper::filterBlogs($type, $count, $category_id);
@endphp

<div class="post_advance_layout">
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
                        class="square-btn d-inline-flex align-items-center justify-content-center"
                        data-ajax-action="load_next_hot_topics_post" aria-label="view-all">
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

    {{-- Layout Code --}}
    @includeIf('theme/newslooks::frontend.includes.post-advance-styles.' . $post_style, [
        'blogs' => $blogs,
    ])

</div>
