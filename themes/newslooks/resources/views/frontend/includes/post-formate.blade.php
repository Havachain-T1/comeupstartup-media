@if ($blog->formate != 'standard')
    <a class="play-button border-style size-40 d-flex align-items-center justify-content-center text-white"
        href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}" aria-label="video-icon">
        @if ($blog->formate == 'audio')
            <i class="fa fa-microphone"></i>
        @elseif ($blog->formate == 'video')
            <i class="fa fa-play"></i>
        @elseif ($blog->formate == 'gallery')
            <i class="fa fa-image"></i>
        @endif
    </a>
@endif