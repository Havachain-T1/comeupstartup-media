<div
    class="post--item media align-items-md-center flex-column flex-md-row c2-hover post-has-excerpt category-on-image mb-30 post-style-one {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">

    <div class="position-relative mb-20 mb-md-0">
        @php
            $small_variation = getImageVariation($blog->image, 'small');
        @endphp
        <!-- Image -->
        <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img mb-0">
            <img data-src="{{ isset($blog->image) ? $small_variation : '' }}" alt="{{ $blog->name }}" class="lazy">
        </a>
        <!-- End Image -->

        <!-- Category -->
        @if (count($blog->categories) > 0)
            <a class="post--category cat-btn text-uppercase title-font text-white"
                href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
        @endif
        <!-- End Category -->
        
        <!-- Formate -->
        @includeIf('theme/newslooks::frontend.includes.post-formate', ['blog' => $blog])
    </div>

    <!-- Post Content -->
    <div class="post--content ml-md-30">
        <h3 class="post--title fw-bold">
            <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
        </h3>
        <ul class="nav post--meta">
            <li><a
                    href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($blog->user->name))) }}">
                    <img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/user-fill.svg"
                        alt="">{{ $blog->user->name }}</a>
            </li>

            </li>
            <li><a href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}"
                    class="c2-hover"><img class="svg mx-5"
                        src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                        alt="">{{ getFormatedDateTime($blog->publish_at, 'Y/m/d') }}</a>
            </li>
            <li><span><img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                        alt="">{{ $blog->views }}</span>
            </li>
        </ul>

        <div class="post--excerpt">
            <p>
                {{ strlen($blog->short_description) > $blog_excerpt ? mb_substr($blog->short_description, 0, $blog_excerpt, 'UTF-8') . '...' : $blog->short_description }}
            </p>
        </div>

        <a class="btn btn-borderd radius-50"
            href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $read_more }}</a>
    </div>
    <!-- End Post Content -->
</div>
