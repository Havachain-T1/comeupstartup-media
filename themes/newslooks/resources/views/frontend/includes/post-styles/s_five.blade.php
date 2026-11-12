<div
    class="post--item media flex-column c2-hover post-has-excerpt mb-20 post-style-five {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
    <div class="position-relative mb-20 mb-md-0 w-100">
        @php
            $medium_variation = getImageVariation($blog->image, 'medium');
        @endphp
        <!-- Image -->
        <a class="post--img mb-25" href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">
            <img data-src="{{ isset($blog->image) ? $medium_variation : '' }}" alt="{{ $blog->name }}" class="img-contain lazy">
        </a>
        <!-- End Image -->

        <!-- Category -->
        @if (count($blog->categories) > 0)
            <a class="post--category cat-btn text-uppercase title-font c2-bg c2-bo text-white"
                href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
        @endif
        <!-- End Category -->

        <!-- Formate -->
        @includeIf('theme/newslooks::frontend.includes.post-formate', ['blog' => $blog])
    </div>

    <!-- Post Content -->
    <div class="post--content mt-10">
        <h3 class="post--title fw-bold">
            <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
        </h3>
        <ul class="nav post--meta mt-10">
            <li><a class="c2-hover"
                    href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($blog->user->name))) }}">
                    <img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/user-fill.svg"
                        alt="">
                    {{ $blog->user->name }}</a>
            </li>
            <li>
                <a class="c2-hover"
                    href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}">
                    <img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                        alt="">
                    {{ getFormatedDateTime($blog->publish_at, 'M d Y') }}
                </a>
            </li>
            <li><span><img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                        alt="">{{ $blog->views }}</span></li>
        </ul>

        <div class="post--excerpt">
            <p>
                {{ strlen($blog->short_description) > $blog_excerpt ? mb_substr($blog->short_description, 0, $blog_excerpt, 'UTF-8') . '...' : $blog->short_description }}
            </p>
        </div>
    </div>
    <!-- End Post Content -->
</div>
