<div class="post--items position-relative post-advance-layout-6">
    <div class="row">
        @foreach ($blogs as $blog)
            @if ($loop->iteration === 1)
                <div class="col-12">
                    <!-- Post Item -->
                    <div
                        class="post--item bg-img-style big post-white bg-overlay mb-30 layout-6-big-post {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
                        <!-- Image -->
                        <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                            <img data-src="{{ getFilePath($blog->image) }}" alt="{{ $blog->name }}" class="lazy">
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
                    </div>
                    <!-- End Post Item -->
                </div>
            @endif

            @if ($loop->iteration > 1)
                <div class="col-md-4 col-sm-6">
                    <!-- Post Item -->
                    <div
                        class="post--item layout-6-small-post media flex-column mb-30">
                        @php
                            $medium_variation = getImageVariation($blog->image, 'medium');
                        @endphp
                        <!-- Image -->
                        <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                            <img data-src="{{ isset($blog->image) ? $medium_variation : '' }}" alt="{{ $blog->name }}" class="lazy">
                        </a>
                        <!-- End Image -->

                        <!-- Post Content -->
                        <div class="post--content">
                            <!-- Category -->
                            @if (count($blog->categories) > 0)
                                <a class="post--category c1 text-uppercase title-font mb-1"
                                    href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
                            @endif
                            <!-- End Category -->

                            <h4 class="post--title">
                                <a
                                    href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                            </h4>

                            <ul class="nav post--meta">
                                <li><a href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}"
                                        class="c2-hover"><img class="svg mx-5"
                                            src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                                            alt="">{{ getFormatedDateTime($blog->publish_at, 'Y/m/d') }}</a>
                                </li>
                            </ul>
                        </div>
                        <!-- End Post Content -->
                    </div>
                    <!-- End Post Item -->
                </div>
            @endif
        @endforeach
    </div>
</div>
