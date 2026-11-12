<div class="post--items position-relative post-advance-layout-2">
    <div class="row">
        @foreach ($blogs as $blog)
            <!-- First 3 Item -->
            @if ($loop->iteration <= 3)
                <div class="col-lg-3 col-sm-6">
                    <!-- Post Item -->
                    <div
                        class="post--item bg-img-style post-white bg-overlay mb-30 {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
                        @php
                            $medium_variation = getImageVariation($blog->image, 'medium');
                        @endphp
                        <!-- Image -->
                        <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                            <img data-src="{{ isset($blog->image) ? $medium_variation : '' }}" alt="{{ $blog->name }}"
                                class="lazy">
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
                            </ul>
                        </div>
                        <!-- End Post Content -->
                    </div>
                    <!-- End Post Item -->
                </div>
            @endif
        @endforeach

        @if (count($blogs) > 3)
            <div class="col-lg-3 col-sm-6">
                <!-- Post Widget -->
                <div class="post-widget mb-30">

                    @foreach ($blogs as $blog)
                        @if ($loop->iteration > 3)
                            <!-- Post Item -->
                            <div class="post--item media align-items-center">
                                @php
                                    $small_variation = getImageVariation($blog->image, 'small');
                                @endphp
                                <!-- Image -->
                                <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}"
                                    class="post--img img-100">
                                    <img data-src="{{ isset($blog->image) ? $small_variation : '' }}"
                                        alt="{{ $blog->name }}" class="lazy">
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
                                    <h5 class="post--title">
                                        <a
                                            href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                                    </h5>
                                </div>
                                <!-- End Post Content -->
                            </div>
                            <!-- End Post Item -->
                        @endif
                    @endforeach

                </div>
                <!-- End Post Widget -->
            </div>
        @endif
    </div>
</div>
