@php
    $count = isset($value['number_of_blogs']) ? $value['number_of_blogs'] : null;

    $recentBlogs = BlogHelper::getRecentBlogs($count);
    $popularBlogs = BlogHelper::getPopularBlogs($count);
    $commentBlogs = BlogHelper::getMostCommentBlogs($count);
@endphp

<!-- Widget Post Tab -->
<div class="widget widget_post_tab">
    <ul class="nav align-items-center post--tab mb-25" data-ajax="tab">
        <li class="active">
            <a href="#" data-ajax-action="recent_post">{{ front_translate('Recent') }}</a>
        </li>
        <li>
            <a href="#" data-ajax-action="popular_post">{{ front_translate('Popular') }}</a>
        </li>
        <li>
            <a href="#" data-ajax-action="comments_post">{{ front_translate('Comments') }}</a>
        </li>
    </ul>

    <div class="position-relative post--items">
        <div id="tab_post">
            <div id="recent_post">
                <ul class="list-unstyled post--widget">

                    @foreach ($recentBlogs as $blog)
                        <!-- Post Item -->
                        <li class="post--item media align-items-center c7 img-circle image-overlay post-has-count">
                            <!-- Image -->
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
                                    <a
                                        href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                                </h5>

                                <ul class="nav post--meta">
                                    <li>
                                        <a href="#">
                                            <img class="svg mx-5"
                                                src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                                                alt="count">
                                            {{ $blog->views }}
                                        </a>
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
                                </ul>
                            </div>
                            <!-- End Post Content -->
                        </li>
                        <!-- End Post Item -->
                    @endforeach

                </ul>
            </div>

            <div class="d-none" id="popular_post">
                <ul class="list-unstyled post--widget">

                    @foreach ($popularBlogs as $blog)
                        <!-- Post Item -->
                        <li class="post--item media align-items-center c7 img-circle image-overlay post-has-count">
                            <!-- Image -->
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
                                    <a
                                        href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                                </h5>

                                <ul class="nav post--meta">
                                    <li>
                                        <a href="#">
                                            <img class="svg mx-5"
                                                src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                                                alt="count">
                                            {{ $blog->views }}
                                        </a>
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
                                </ul>
                            </div>
                            <!-- End Post Content -->
                        </li>
                        <!-- End Post Item -->
                    @endforeach

                </ul>
            </div>

            <div class="d-none" id="comments_post">
                <ul class="list-unstyled post--widget">

                    @foreach ($commentBlogs as $blog)
                        <!-- Post Item -->
                        <li class="post--item media align-items-center c7 img-circle image-overlay post-has-count">
                            <!-- Image -->
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
                                    <a
                                        href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                                </h5>

                                <ul class="nav post--meta">
                                    <li>
                                        <a href="#">
                                            <img class="svg mx-5"
                                                src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                                                alt="count">
                                            {{ $blog->views }}
                                        </a>
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
                                </ul>
                            </div>
                            <!-- End Post Content -->
                        </li>
                        <!-- End Post Item -->
                    @endforeach

                </ul>
            </div>
        </div>

        <!-- Preloader -->
        <div
            class="preloader fixed-top position-absolute bg-white w-100 h-100 align-items-center justify-content-center">
            <div class="preloader-inner"></div>
        </div>
        <!-- End Preloader -->
    </div>
</div>
<!-- End Widget Post Tab -->
