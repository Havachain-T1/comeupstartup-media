@php
    $count = isset($data['number_of_category']) ? $data['number_of_category'] : null;

    $categories = BlogHelper::getCategories($count);
@endphp


@isset($data['title_t_'])
    <!-- Section Title -->
    <div class="section-title has-bg-shape shape--two mb-30">
        <h2 class="c1">{{ $data['title_t_'] }}</h2>
    </div>
    <!-- End Section Title -->
@endisset

<ul>
    @foreach ($categories as $cat)
        <li class="d-flex align-items-center justify-content-between position-relative">
            <a class="c1-hover"
                href="{{ route('theme.newslooks.blog.blogByCategory', $cat->permalink) }}">{{ $cat->name }}</a>
            <div class="">
                <span class="text-center py-10">{{ $cat->blogs_count }}</span>
            </div>
        </li>
    @endforeach
</ul>
