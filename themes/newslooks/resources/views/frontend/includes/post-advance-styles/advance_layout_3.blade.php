<ul class="list-unstyled post--items post-advance-layout-3">
    @foreach ($blogs as $blog)
        @if ($loop->iteration === 1)
            <!-- Post Item -->
            <li
                class="post--item bg-img-style post-white c1-hover mb-30 bg-overlay layout-3-big-post {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
                @php
                    $large_variation = getImageVariation($blog->image, 'large');
                @endphp
                <!-- Image -->
                <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                    <img data-src="{{ isset($blog->image) ? $large_variation : '' }}" alt="{{ $blog->name }}" class="lazy">
                </a>
                <!-- End Image -->

                <!-- Formate -->
                @includeIf('theme/newslooks::frontend.includes.post-formate', ['blog' => $blog])

                <!-- Post Content -->
                <div class="post--content p-20">
                    @if (count($blog->categories) > 0)
                        <a class="post--category cat-btn text-uppercase title-font"
                            href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
                    @endif

                    <h3 class="post--title">
                        <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
                    </h3>

                    <ul class="nav post--meta">
                        <li><a href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}"
                                class="c2-hover"><img class="svg mx-5"
                                    src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                                    alt="">{{ getFormatedDateTime($blog->publish_at, 'Y/m/d') }}</a>
                        </li>
                    </ul>
                </div>
                <!-- End Post Content -->
            </li>
            <!-- End Post Item -->
        @endif

        @if ($loop->iteration > 1)
            <!-- Post Item -->
            <li class="post--item media align-items-center mb-15 c1-hover layout-3-small-post">
                @php
                    $small_variation = getImageVariation($blog->image, 'small');
                @endphp
                <!-- Image -->
                <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img">
                    <img data-src="{{ isset($blog->image) ? $small_variation : '' }}" alt="{{ $blog->name }}" class="lazy">
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
                        <li><a href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}"
                                class="c2-hover"><img class="svg mx-5"
                                    src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                                    alt="">{{ getFormatedDateTime($blog->publish_at, 'Y/m/d') }}</a>
                        </li>

                        <li><span><img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                                    alt="">{{ $blog->views }}</span>
                        </li>
                    </ul>
                </div>
                <!-- End Post Content -->
            </li>
            <!-- End Post Item -->
        @endif
    @endforeach
</ul>
