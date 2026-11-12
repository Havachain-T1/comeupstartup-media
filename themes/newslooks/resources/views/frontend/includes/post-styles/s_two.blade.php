<div
    class="post--item category-on-image meta-on-image c2-hover mb-30 w-100 post-style-two {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
    <div class="position-relative radius-5 d-inline-flex w-100">
        @php
            $medium_variation = getImageVariation($blog->image, 'medium');
        @endphp
        <!-- Image -->
        <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" class="post--img mb-0 d-inline w-100">
            <img data-src="{{ $medium_variation }}" alt="{{ $blog->name }}" class="lazy">
        </a>
        <!-- End Image -->

        <!-- Post Category -->
        @if (count($blog->categories) > 0)
            <a class="post--category cat-btn text-uppercase title-font text-white"
                href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
        @endif
        <!-- End Post Category -->

        <!-- Formate -->
        @includeIf('theme/newslooks::frontend.includes.post-formate', ['blog' => $blog])

        <ul class="nav post--meta media bg-off-white p-20">
            <li class="mr-10">
                <a class="author--image"
                    href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($blog->user->name))) }}">
                    <img class="radius-50 author-img" src="{{ getFilePath($blog->user->image) }}"
                        alt="{{ $blog->user->name }}">
                </a>
            </li>
            <li class="media-body d-flex flex-column aligh-items-start">
                <a class="title-color-two c2-hover fw-bold mb-5"
                    href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($blog->user->name))) }}">{{ $blog->user->name }}</a>
                <a class="title-color-two c2-hover"
                    href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}">
                    <img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg" alt="clock">
                    {{ getFormatedDateTime($blog->publish_at, 'M d Y') }}
                </a>
            </li>
        </ul>
    </div>

    <!-- Post Content -->
    <div class="post--content pt-20 px-15">
        <h3 class="post--title fw-bold mb-10">
            <a class="title-color-two c2-hover"
                href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
        </h3>

        <div class="post--excerpt">
            <p>
                {{ strlen($blog->short_description) > $blog_excerpt ? mb_substr($blog->short_description, 0, $blog_excerpt, 'UTF-8') . '...' : $blog->short_description }}
            </p>
        </div>
    </div>
    <!-- End Post Content -->
</div>
