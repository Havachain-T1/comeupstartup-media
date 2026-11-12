@php
    $count = isset($data['count']) ? $data['count'] : null;
    $type = isset($data['type']) ? $data['type'] : null;
    $category = $type == 'category' ? $data['category'] : null;

    $blogs = BlogHelper::filterBlogs($type, $count, $category);
@endphp

<!-- Widget Blog List Start -->
@isset($data['title_t_'])
    <div>
        <!-- Section Title -->
        <div class="section-title has-bg-shape shape--two mb-30">
            <h2 class="c1">{{ $data['title_t_'] }}</h2>
        </div>
        <!-- End Section Title -->
    </div>
@endisset

<div class="post--items position-relative mb-30" id="post_recent_widget">
    <ul class="list-unstyled post--widget">

        @foreach ($blogs as $blog)
            <!-- Post Item -->
            <li class="post--item media align-items-center c7">
                @php
                    $small_variation = getImageVariation($blog->image, 'small');
                @endphp
                <!-- Image -->
                <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                    <img data-src="{{ isset($blog->image) ? $small_variation : '' }}" alt="{{ $blog->name }}"
                        class="img-contain lazy">
                </a>
                <!-- End Image -->

                <!-- Post Content -->
                <div class="post--content">
                    @if (count($blog->categories) > 0)
                        <a class="post--category c1 text-uppercase title-font"
                            href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
                    @endif

                    <h5 class="post--title">
                        <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                    </h5>

                    <ul class="nav post--meta">
                        <li>
                            <a
                                href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}">
                                <img class="svg mx-5"
                                    src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                                    alt="clock">
                                {{ getFormatedDateTime($blog->publish_at, 'M d, Y') }}
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- End Post Content -->
            </li>
            <!-- End Post Item -->
        @endforeach

    </ul>
</div>
<!-- Widget Blog List End -->
