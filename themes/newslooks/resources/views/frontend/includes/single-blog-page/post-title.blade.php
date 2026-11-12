@if (isset($single_blog_page['category']) && $single_blog_page['category'] == 1)
    <!-- Category -->
    @foreach ($blog->categories as $cat)
        <a class="post--category cat-btn text-uppercase title-font c2-bg c2-bo text-white d-inline-block mb-15"
            href="{{ route('theme.newslooks.blog.blogByCategory', $cat->permalink) }}">{{ $cat->translation('name', getFrontLocale()) }}</a>
    @endforeach
    <!-- End Category -->
@endif

<!-- Post Title -->
<h1 class="post-title mb-10">
    <a href="javascript:;" style="pointer-events: none;">{{ $blog->translation('name', getFrontLocale()) }}</a>

</h1>
<!-- End Post Title -->

<!-- Post Meta -->
<ul class="nav post--meta p-0">
    @if (isset($single_blog_page['author']) && $single_blog_page['author'] == 1)
        <li>
            <a href="{{ route('theme.newslooks.blog.blogByAuthor', str_replace(' ', '-', strtolower($blog->user->name))) }}"
                class="c2-hover">
                <img class="svg mx-5 mb-1" src="{{ asset('themes/newslooks/public/') }}/img/icon/user-fill.svg"
                    alt="user">
                {{ $blog->user->name }}
            </a>
        </li>
    @endif

    @if (isset($single_blog_page['date']) && $single_blog_page['date'] == 1)
        <li><a href="{{ route('theme.newslooks.blog.blogByDate', getFormatedDateTime($blog->publish_at, 'Y/m/d')) }}"
                class="c2-hover"><img class="svg mx-5"
                    src="{{ asset('themes/newslooks/public/') }}/img/icon/clock-fill.svg"
                    alt="date">{{ getFormatedDateTime($blog->publish_at, 'M d Y') }}</a>
        </li>
    @endif

    @if (isset($single_blog_page['date']) && $single_blog_page['date'] == 1)
        <li><span><img class="svg c2 mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/fire.svg"
                    alt="count">{{ $blog->views }}</span></li>
    @endif

    @if (true)
        <li>
            @if (Auth::check() && Auth::user()->user_type == config('settings.user_type.user'))
                <a href="javascript:;void(0)" id="reading-list-action" data-blog="{{ $blog->id }}"
                    data-user="{{ Auth::user()->id }}"
                    class="{{ Auth::user()->isBlogReadingList($blog->id) ? 'c1' : '' }} font-18"
                    title="{{ Auth::user()->isBlogReadingList($blog->id) ? front_translate('Remove From Reading List') : front_translate('Add To Reading List') }}">
                    <i class="fa fa-bookmark"></i>
                </a>
            @else
                <a href="{{ route('theme.newslooks.user.login') }}" class="font-18"
                    title="{{ front_translate('Add To Reading List') }}">
                    <i class="fa fa-bookmark"></i>
                </a>
            @endif
        </li>
    @endif
</ul>
<!-- End Post Meta -->
