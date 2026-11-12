@php
    $type = isset($data['type']) ? $data['type'] : null;
    $count = isset($data['count']) ? $data['count'] : null;
    $category = $type == 'category' ? $data['category'] : null;

    $blogs = BlogHelper::filterBlogs($type, $count, $category);
@endphp

<!-- Popular Gallery -->
@isset($data['title_t_'])
    <!-- Section Title -->
    <div class="section-title has-bg-shape shape--two mb-30">
        <h2 class="c1">{{ $data['title_t_'] }}</h2>
    </div>
    <!-- End Section Title -->
@endisset

<ul>
    @foreach ($blogs as $blog)
        <li>
            <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" aria-label="gallery-image">
                @php
                    $small_variation = getImageVariation($blog->image, 'small');
                @endphp
                <img data-src="{{ isset($blog->image) ? $small_variation : '' }}" alt="{{ $blog->name }}" class="lazy">
            </a>
        </li>
    @endforeach
</ul>
<!-- End Popular Gallery -->
