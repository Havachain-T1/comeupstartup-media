<ul class="nav post-filters justify-content-center">
    @if ($data['featured_t_'])
        <li class="px-3 pb-2">
            <a href="{{ route('theme.newslooks.blog.blogByFilter', 'feature') }}" class="text-center">
                <i class="fa fa-star-o d-block"></i>
                <span>{{ $data['featured_t_'] }}</span>
            </a>
        </li>
    @endif

    @if ($data['most_popular_t_'])
        <li class="px-3 pb-2">
            <a href="{{ route('theme.newslooks.blog.blogByFilter', 'popular') }}" class="text-center">
                <i class="fa fa-heart-o d-block"></i>
                <span>{{ $data['most_popular_t_'] }}</span>
            </a>
        </li>
    @endif

    @if ($data['most_viewed_t_'])
        <li class="px-3 pb-2">
            <a href="{{ route('theme.newslooks.blog.blogByFilter', 'most_view') }}" class="text-center">
                <i class="fa fa-eye d-block"></i>
                <span>{{ $data['most_viewed_t_'] }}</span>
            </a>
        </li>
    @endif

    @if ($data['recent_t_'])
        <li class="px-3 pb-2">
            <a href="{{ route('theme.newslooks.blog.blogByFilter', 'recent') }}" class="text-center">
                <i class="fa fa-fire d-block"></i>
                <span>{{ $data['recent_t_'] }}</span>
            </a>
        </li>
    @endif

    @if ($data['most_commented_t_'])
        <li class="px-3 pb-2">
            <a href="{{ route('theme.newslooks.blog.blogByFilter', 'most_comment') }}#" class="text-center">
                <i class="fa fa-comments-o d-block"></i>
                <span>{{ $data['most_commented_t_'] }}</span>
            </a>
        </li>
    @endif
</ul>
