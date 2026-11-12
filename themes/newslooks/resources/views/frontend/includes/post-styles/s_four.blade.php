<div
    class="post--item bg-img-style post-white bg-overlay overlay-color-two c2-hover mb-30 post-style-four {{ $blog->formate != 'standard' ? 'video-button-middle' : '' }}">
    @php
        $medium_variation = getImageVariation($blog->image, 'medium');
    @endphp
    <!-- Image -->
    <a class="post--img" href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">
        <img data-src="{{ $medium_variation }}" alt="{{ $blog->name }}" class="lazy">
    </a>
    <!-- End Image -->

    <!-- Formate -->
    @includeIf('theme/newslooks::frontend.includes.post-formate', ['blog' => $blog])

    <!-- Post Content -->
    <div class="post--content">
        @if (count($blog->categories) > 0)
            <a class="post--category cat-btn text-uppercase title-font c2-bg c2-bo"
                href="{{ route('theme.newslooks.blog.blogByCategory', $blog->categories->first()->permalink) }}">{{ $blog->categories->first()->name }}</a>
        @endif

        <h3 class="post--title">
            <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">{{ $blog->name }}</a>
        </h3>

        <ul class="nav post--meta">
            <li><a
                    href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}">
                    <img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                        alt="">
                    {{ getFormatedDateTime($blog->publish_at, 'M d Y') }}</a>
            </li>
        </ul>
    </div>
    <!-- End Post Content -->
</div>
