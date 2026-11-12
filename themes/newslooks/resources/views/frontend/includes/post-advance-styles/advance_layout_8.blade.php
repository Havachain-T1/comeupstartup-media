<div class="post--items posts-style-grid grid-style--four position-relative" id="post_more_news">
    <ul class="list-unstyled posts">
        @foreach ($blogs as $blog)
            @if ($loop->iteration === 1)
                <!-- Post Item -->
                <li
                    class="post--item bg-img-style post-white bg-overlay {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
                    <!-- Image -->
                    @php
                        $big_image = getImageVariation($blog->image, 'large');
                    @endphp
                    <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                        <img data-src="{{ isset($blog->image) ? $big_image : '' }}" alt="{{ $blog->name }}" class="lazy">
                    </a>
                    <!-- End Image -->

                    <!-- Formate -->
                    @includeIf('theme/newslooks::frontend.includes.post-formate', ['blog' => $blog])

                    <!-- Post Content -->
                    <div class="post--content">
                        <!-- Category -->
                        @if (count($blog->categories) > 0)
                            <a class="post--category cat-btn text-uppercase title-font"
                                href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
                        @endif
                        <!-- End Category -->

                        <h3 class="post--title">
                            <a
                                href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                        </h3>

                        <ul class="nav post--meta">
                            <li><a
                                    href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($blog->user->name))) }}">
                                    <img class="svg mx-5"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/user-fill.svg"
                                        alt="">{{ $blog->user->name }}</a>
                            </li>

                            <li><a href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}"
                                    class="c2-hover"><img class="svg mx-5"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                                        alt="">{{ getFormatedDateTime($blog->publish_at, 'Y/m/d') }}</a>
                            </li>

                            <li><span><img class="svg mx-5"
                                        src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                                        alt="">{{ $blog->views }}</span>
                            </li>
                        </ul>
                    </div>
                    <!-- End Post Content -->
                </li>
                <!-- End Post Item -->
            @endif

            @if ($loop->iteration > 1)
                <!-- Post Item -->
                <li
                    class="post--item media align-items-center">
                    <!-- Image -->
                    @php
                        $small_image = getImageVariation($blog->image, 'small');
                    @endphp
                    <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img img-100">
                        <img data-src="{{ isset($blog->image) ? $small_image : '' }}" alt="{{ $blog->name }}" class="lazy">
                    </a>
                    <!-- End Image -->

                    <!-- Post Content -->
                    <div class="post--content">
                        <!-- Category -->
                        @if (count($blog->categories) > 0)
                            <a class="post--category c1 text-uppercase title-font"
                                href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
                        @endif
                        <!-- End Category -->

                        <h5 class="post--title mt-0">
                            <a
                                href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                        </h5>
                    </div>
                    <!-- End Post Content -->
                </li>
                <!-- End Post Item -->
            @endif
        @endforeach
    </ul>
</div>
