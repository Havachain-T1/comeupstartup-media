@php
    $count = isset($data['tag_count']) ? $data['tag_count'] : null;

    $tags = BlogHelper::getTags($count);
@endphp

@isset($data['title_t_'])
    <!-- Section Title -->
    <div class="section-title has-bg-shape shape--two mb-30">
        <h2 class="c1">{{ $data['title_t_'] }}</h2>
    </div>
    <!-- End Section Title -->
@endisset

<div class="tags">
    @foreach ($tags as $tag)
        <a class="#" href="{{ route('theme.newslooks.blog.blogByTag', $tag->permalink) }}">{{ $tag->name }}</a>
    @endforeach
</div>
