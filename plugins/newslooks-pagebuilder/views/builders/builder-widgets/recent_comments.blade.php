@php
    $count = isset($data['count']) ? $data['count'] : null;

    $comments = BlogHelper::getRecentComments($count);

    $comment_setting = commentFormSettings();
@endphp

<!-- Widget Recent Comment -->
@isset($data['title_t_'])
    <!-- Section Title -->
    <div class="section-title has-bg-shape shape--two mb-30">
        <h2 class="c1">{{ $data['title_t_'] }}</h2>
    </div>
    <!-- End Section Title -->
@endisset

<ul>
    @foreach ($comments as $comment)
        <li class="single-comment">
            @php
                $author_image = $comment->user_type == 'admin' || $comment->user_type == 'user' ? userImage($comment->user) : null;
                $author_name = $comment->user_type == 'admin' || $comment->user_type == 'user' ? $comment->user->name : null;

                $author_name = isset($author_name) ? $author_name : $comment->user_name;
                $setting_image = $comment_setting['show_avatars'] == 1 ? asset('/public/comment-author-image/' . $comment_setting['avatar_default'] . '.png') : getFilePath($author_image);
                $author_image = $author_image ?? $setting_image;
            @endphp
            
            <img class="comment-author-img" src="{{ $author_image }}" alt="">
            <span class="comment-author-name">by {{ $author_name }}</span>
            <p class="comment-text">{{ $comment->comment }}</p>

            <span class="quote-icon c1">
                <img class="svg quote-img c1" src="{{ asset('themes/newslooks/public/') }}/img/icon/quote.svg"
                    alt="quoto">
            </span>
        </li>
    @endforeach

</ul>
<!-- End Widget Recent Comment -->
