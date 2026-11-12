@php
    $label = $label + 1;
    $comment_close = commentClose($blog->publish_at); //If a comment is close or not

    // Cheking child comment thread level
    if ($comment_setting['thread_comments'] == 1) {
        $nested_level = $comment_setting['thread_comments_level'];
    } else {
        $nested_level = 6;
    }

@endphp

@foreach ($child_comments as $child)
    <ul class="children">
        <li class="comment row mx-0" id="comment-{{ $child->id }}">
            @for ($i = 0; $i < $label; $i++)
                @if ($i == $nested_level)
                @break
            @endif
            <div class="ml-0 ml-sm-50"></div>
        @endfor

        <div class="flex-grow-1 mx-10">
            <!-- Single Comment -->
            <article class="single-comment media mt-25">
                <!-- Comment Author Image -->
                <div class="comment-author-image">
                    @php
                        $author_image = $child->user_type == 'admin' || $child->user_type == 'user' ? userImage($child->user) : null;
                        $author_name = $child->user_type == 'admin' || $child->user_type == 'user' ? $child->user->name : null;

                        $author_name = isset($author_name) ? $author_name : $child->user_name;
                        $count_child = count($child->childs);
                    @endphp
                    <img alt="author-img" class="lazy"
                        src="
                        @if (isset($author_image)) {{ $author_image }}
                        @else
                            @if ($comment_setting['show_avatars'] == 1)
                                {{ asset('/public/comment-author-image/' . $comment_setting['avatar_default'] . '.png') }}
                            @else
                                {{ getFilePath($author_image) }} @endif
                        @endif
                        ">
                </div>
                <!-- End Comment Author Image -->

                <!-- Comment Content -->
                <div class="comment-content media-body mb-0">
                    <div class="">
                        <h5 class="author_name d-inline-block">{{ $author_name }}</h5>
                        <span
                            class="commented-on">{{ getFormatedDateTime($child->comment_date, 'j M Y \a\t g:i a') }}
                        </span>
                    </div>

                    <p class="font-14">{{ $child->comment }}</p>

                    <div class="comment-reply-links">
                        {{-- Checking if close closing settings is on and is comment close --}}
                        @if (!($comment_setting['close_comments_for_old_blogs'] == '1' && $comment_close == true))
                            <a href="javascript:void(0)" class="reply-btn" data-id='{{ $child->id }}'
                                data-username='{{ $author_name }}'>{{ front_translate('Reply') }}</a>
                        @endif
                        {{-- Checking if Comment has Reply or not --}}
                        @if ($count_child > 0)
                            {{-- see reply on collapse --}}
                            <a class="collapsed more_comment_btn" href="javascript:;void(0)" data-toggle="collapse"
                                data-target="#replyToggle{{ $child->id }}" aria-expanded="false"
                                aria-controls="#replyToggle{{ $child->id }}">
                                {{ front_translate('See Replies') }}
                            </a>
                        @endif
                    </div>
                </div>
                <!-- End Comment Content -->
            </article>
            <!-- End Single Comment -->
        </div>

    </li>
</ul>

{{-- if comment has reply including them --}}
@if ($count_child > 0)
    <div class="collapse" id="replyToggle{{ $child->id }}">
        @include('theme/newslooks::frontend.includes.comment.child_comment', [
            'comment_setting' => $comment_setting,
            'child_comments' => $child->childs,
            'label' => $label,
        ])
    </div>
@endif
@endforeach
