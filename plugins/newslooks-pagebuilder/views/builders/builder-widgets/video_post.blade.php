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

    $blogs = BlogHelper::filterBlogs($type, $count, $category_id);
@endphp

@isset($data['title_t_'])
    <div class="row align-items-center">
        <div class="col">
            <!-- Title -->
            <div class="section-title has-bg-shape shape--two mb-30">
                <h2 class="c1">{{ $data['title_t_'] }}</h2>
            </div>
            <!-- End Title -->
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

<div class="row no-gutters">
    <div class="col-lg-8">
        @php
            $firstBlog = $blogs->first();
        @endphp

        @if (count($blogs) > 0)
            <!-- Post Item -->
            <div class="post--item bg-img-style big post-white bg-overlay video-button-middle video-post-big">
                <!-- Image -->
                <a href="{{ route('theme.newslooks.blog.details', $firstBlog->permalink) }}" class="post--img img-100">
                    <img data-src="{{ getFilePath($firstBlog->image) }}" alt="{{ $firstBlog->name }}"
                        class="lazy">
                </a>
                <!-- End Image -->

                <!-- Post Content -->
                <div class="post--content">
                    <!-- Categories -->
                    @if ($firstBlog->categories)
                        <a class="post--category cat-btn text-uppercase title-font align-self-start"
                            href="{{ route('theme.newslooks.blog.blogByCategory', $firstBlog->categories->first()->permalink) }}">{{ $firstBlog->categories->first()->name }}</a>
                    @endif

                    <!-- Video Button -->
                    <a class="play-button border-style size-80 d-flex align-items-center justify-content-center text-white m-auto video-post-button"
                        href="{{ route('theme.newslooks.blog.details', $firstBlog->permalink) }}"
                        aria-label="video-icon">
                        <img class="svg" src="{{ asset('themes/newslooks/public/') }}/img/icon/play-lg.svg"
                            alt="play">
                    </a>
                    <!-- End Video Button -->

                    <h3 class="post--title">
                        <a
                            href="{{ route('theme.newslooks.blog.details', $firstBlog->permalink) }}">{{ $firstBlog->name }}</a>
                    </h3>

                    <ul class="nav post--meta">
                        <li><a
                                href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($firstBlog->user->name))) }}">
                                <img class="svg mx-5"
                                    src="{{ asset('themes/newslooks/public/') }}/img/icon/user-fill.svg"
                                    alt="user">{{ $firstBlog->user->name }}</a>
                        </li>

                        <li>
                            <a
                                href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($firstBlog->publish_at, 'Y/m/d')) }}">
                                <img class="svg mx-5"
                                    src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                                    alt="clock">
                                {{ getFormatedDateTime($firstBlog->publish_at, 'M d, Y') }}
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <img class="svg mx-5 c1"
                                    src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg" alt="count">
                                {{ $firstBlog->views }}
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- End Post Content -->
            </div>
            <!-- End Post Item -->
        @endif

    </div>
    <div class="col-lg-4 overflow-hidden">
        <!-- Video Playlist -->
        <div class="video--playlist bg-white">
            <div class="h-100" data-simplebar>
                <div class="video--playlist--header media align-items-center c1-bg">
                    <span
                        class="play-button bg-white size-35 d-inline-flex align-items-center justify-content-center c1">
                        <img class="svg" src="{{ asset('themes/newslooks/public/') }}/img/icon/play.svg"
                            alt="play">
                    </span>
                    <div class="media-body text-white">
                        @isset($data['playlist_title_t_'])
                            <h4 class="text-uppercase text-white">{{ $data['playlist_title_t_'] }}</h4>
                        @endisset
                        <p>1/{{ count($blogs) }} {{ front_translate('Videos') }}</p>
                    </div>
                </div>

                <ul class="list-unstyled post--widget p-30">
                    @foreach ($blogs as $blog)
                        @if ($loop->first)
                            @continue
                        @endif

                        <!-- Post Item -->
                        <li class="post--item media align-items-center mb-30">
                            @php
                                $small_variation = getImageVariation($blog->image, 'small');
                            @endphp
                            <!-- Image -->
                            <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}"
                                class="img-100 mx-10">
                                <img data-src="{{ $small_variation }}" alt="{{ $blog->name }}"
                                    class="img-contain lazy">
                            </a>
                            <!-- End Image -->

                            <!-- Post Content -->
                            <div class="post--content">
                                <h5 class="post--title">
                                    <a
                                        href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
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
        </div>
        <!-- End Videoplaylist -->
    </div>
</div>
