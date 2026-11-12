@php
    $count = isset($data['count']) ? $data['count'] : null;
    $type = isset($data['type']) ? $data['type'] : null;
    $category = $type == 'category' ? $data['category'] : null;

    $blogs = BlogHelper::filterBlogs($type, $count, $category);
@endphp

<div class="swiper-container slider-post">
    <div class="swiper-wrapper">
        @foreach ($blogs as $blog)
            <div class="swiper-slide">
                <!-- Post Item -->
                <div
                    class="post--item bg-img-style post-white bg-overlay radius-0 {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
                    @php
                        $medium_variation = getImageVariation($blog->image, 'medium');
                    @endphp
                    <!-- Image -->
                    <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                        <img src="{{ isset($blog->image) ? $medium_variation : '' }}" alt="{{ $blog->name }}">
                    </a>
                    <!-- End Image -->

                    <!-- Formate -->
                    @includeIf('theme/newslooks::frontend.includes.post-formate', ['blog' => $blog])

                    <!-- Post Content -->
                    <div class="post--content">
                        <!-- Categories -->
                        @if (count($blog->categories) > 0)
                            <a class="post--category cat-btn text-uppercase title-font"
                                href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
                        @endif

                        <h3 class="post--title">
                            <a
                                href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                        </h3>

                        <ul class="nav post--meta">
                            <li><a
                                    href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($blog->user->name))) }}">
                                    <img class="svg mx-5"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/user-fill.svg"
                                        alt="user">{{ $blog->user->name }}</a>
                            </li>

                            <li>
                                <a
                                    href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}">
                                    <img class="svg mx-5"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                                        alt="clock">
                                    {{ getFormatedDateTime($blog->publish_at, 'M d, Y') }}
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <img class="svg mx-5"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg" alt="count">
                                    {{ $blog->views }}
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Post Content -->
                </div>
                <!-- End Post Item -->
            </div>
        @endforeach
    </div>

    <!-- Add Pagination -->
    <div class="custom-pagination style--two mt-30 mt-5 text-center"></div>
</div>
