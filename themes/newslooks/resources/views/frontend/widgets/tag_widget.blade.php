@php
    $count = isset($value['number_of_tags']) ? $value['number_of_tags'] : null;
    $tags = BlogHelper::getTags($count);
@endphp
<!-- Widget Tags -->
<div class="widget widget_tags border-style">

    @isset($value['widget_title'])
        <!-- Section Title -->
        <div class="section-title has-bg-shape shape--two mb-30">
            <h2 class="c1">{{ $value['widget_title'] }}</h2>
        </div>
        <!-- End Section Title -->
    @endisset

    <div class="tags">
        @foreach ($tags as $tag)
            <a class="#"
                href="{{ route('theme.newslooks.blog.blogByTag', $tag->permalink) }}">{{ $tag->name }}</a>
        @endforeach
    </div>

</div>
<!-- End Widget Tags -->
