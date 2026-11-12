{{-- Checking If comments is available or not --}}
@if (count($blog_comments) > 0)
    @php
        $comment_close = commentClose($blog->publish_at);
    @endphp

    <h3 class="comments-title">{{ front_translate('Comments') }} (<span
            id="comment_count">{{ count($blog->comments) }}</span> )</h3>

    {{-- Comment List --}}
    <ul class="comment-list">
        {{-- Loop through All Top Level Comments --}}
        @foreach ($blog_comments as $comment)
            <li class="comment" id="comment-{{ $comment->id }}">
                <!-- Single Comment -->
                @php
                    $author_image = $comment->user_type == 'admin' || $comment->user_type == 'user' ? userImage($comment->user) : null;
                    $author_name = $comment->user_type == 'admin' || $comment->user_type == 'user' ? $comment->user->name : null;

                    $author_name = isset($author_name) ? $author_name : $comment->user_name;
                    $count_child = count($comment->childs);
                @endphp
                <article class="single-comment media mt-25">
                    <!-- Comment Author Image -->
                    <div class="comment-author-image">
                        <img alt="author-img" class="lazy"
                            src="
                            @if (isset($author_image)) 
                                {{ $author_image }}
                            @else
                                @if ($comment_setting['show_avatars'] == 1)
                                    {{ asset('/public/comment-author-image/' . $comment_setting['avatar_default'] . '.png') }}
                                @else
                                    {{ getFilePath($author_image) }}
                                @endif
                            @endif
                            ">
                    </div>
                    <!-- End Comment Author Image -->

                    <!-- Comment Content -->
                    <div class="comment-content media-body mb-0">
                        <div class="">
                            <h5 class="author_name d-inline-block">{{ $author_name }}</h5>
                            <span
                                class="commented-on">{{ getFormatedDateTime($comment->comment_date, 'd-m-Y \a\t g:i a') }}</span>
                        </div>

                        <p class="font-14">{{ $comment->comment }}</p>

                        <div class="comment-reply-links">
                            {{-- Checking if close closing settings is on and is comment close --}}
                            @if (!($comment_setting['close_comments_for_old_blogs'] == '1' && $comment_close == true))
                                <a href="javascript:void(0)" class="reply-btn" data-id='{{ $comment->id }}'
                                    data-username='{{ $author_name }}'>{{ front_translate('Reply') }}</a>
                            @endif
                            {{-- Checking if Comment has Reply or not --}}
                            @if ($count_child > 0)
                                {{-- see reply on collapse --}}
                                <a class="collapsed more_comment_btn" href="javascript:;void(0)" data-toggle="collapse"
                                    data-target="#replyToggle{{ $comment->id }}" aria-expanded="false"
                                    aria-controls="#replyToggle{{ $comment->id }}">
                                    {{ front_translate('See Replies') }}
                                </a>
                            @endif
                        </div>
                    </div>
                    <!-- End Comment Content -->
                </article>

                {{-- if comment has reply including them --}}
                @if ($count_child > 0)
                    <div class="collapse" id="replyToggle{{ $comment->id }}">
                        @include('theme/newslooks::frontend.includes.comment.child_comment', [
                            'comment_setting' => $comment_setting,
                            'child_comments' => $comment->childs,
                            'label' => 0,
                        ])
                    </div>
                @endif
            </li>
        @endforeach
        {{-- Loop through All Top Level Comments End --}}
    </ul>
    {{-- Comment List End --}}

    <!-- Comment Pagination -->
    @if ($comment_setting['page_comments'] == 1)
        {{-- Checking if comments have more page or just 1 --}}
        @if ($blog_comments->lastPage() == 1)
            <p class="black mt-3 mr-2 text-center py-2">{{ front_translate('No More Comments') }}</p>
        @else
            <div class="pagination d-flex justify-content-center pt-30 pb-30">
                @php
                    $last_page = $blog_comments->lastPage();
                    $current_page = request()->input('page') ? request()->input('page') : 1;
                    $route = route('theme.newslooks.blog.details', $blog->permalink);
                @endphp

                <ul class="list-unstyled list-inline d-inline-flex align-items-center">
                    {{-- Previous Button --}}
                    <li>
                        <a href="{{ $route . '?page=' . request()->input('page') - 1 }}"
                            style="{{ !request()->input('page') || request()->input('page') == 1 ? 'pointer-events: none' : '' }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="5.605" height="9.746"
                                viewBox="0 0 5.605 9.746" class="svg replaced-svg">
                                <path id="Path_26" data-name="Path 26"
                                    d="M122.5,4.747,118.338,8.9a.349.349,0,1,1-.493-.494l3.915-3.9L117.845.6a.351.351,0,0,1,.493-.5L122.5,4.253a.349.349,0,0,1,0,.494Z"
                                    transform="translate(122.952 9.352) rotate(180)" fill="currentColor"
                                    stroke="currentColor" stroke-width="0.7"></path>
                            </svg>
                        </a>
                    </li>

                    {{-- Pagination Number Start --}}
                    @if ($current_page - 3 > 1)
                        <li><a href="{{ $route . '?page=' . 1 }}">1</a></li>
                        <li><a style="pointer-events: none;">...</a></li>
                    @endif

                    @if ($current_page - 3 == 1)
                        <li><a href="{{ $route . '?page=' . 1 }}">1</a></li>
                    @endif

                    @if ($current_page - 2 > 0)
                        <li><a href="{{ $route . '?page=' . $current_page - 2 }}">
                                {{ $current_page - 2 }}</a></li>
                    @endif

                    @if ($current_page - 1 > 0)
                        <li><a href="{{ $route . '?page=' . $current_page - 1 }}">
                                {{ $current_page - 1 }}</a></li>
                    @endif

                    {{-- Current Page --}}
                    <li><span class="current">{{ $current_page }}</span></li>

                    @if ($current_page + 1 <= $last_page)
                        <li>
                            <a href="{{ $route . '?page=' . $current_page + 1 }}">
                                {{ $current_page + 1 }}</a>
                        </li>
                    @endif

                    @if ($current_page + 2 == $last_page)
                        <li><a href="{{ $route . '?page=' . $last_page }}">
                                {{ $last_page }}</a>
                        </li>
                    @endif

                    @if ($current_page < $last_page - 2)
                        <li><a style="pointer-events: none;">...</a></li>
                        <li><a href="{{ $route . '?page=' . $last_page }}">{{ $last_page }}</a>
                        </li>
                    @endif

                    {{-- Next Button --}}
                    @if (request()->input('page'))
                        <li>
                            <a href="{{ $route . '?page=' . request()->input('page') + 1 }}"
                                style="{{ request()->input('page') == $last_page ? 'pointer-events: none' : '' }}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.603" height="9.742"
                                    viewBox="0 0 5.603 9.742" class="svg replaced-svg">
                                    <path id="Path_26" data-name="Path 26"
                                        d="M122.5,4.747,118.338,8.9a.349.349,0,1,1-.493-.494l3.915-3.9L117.845.6A.349.349,0,0,1,118.338.1L122.5,4.253a.349.349,0,0,1,0,.494Z"
                                        transform="translate(-117.35 0.35)" fill="currentColor" stroke="currentColor"
                                        stroke-width="0.7"></path>
                                </svg>
                            </a>
                        </li>
                    @else
                        <li>
                            <a href="{{ $route . '?page=2' }}"
                                style="{{ $last_page == 1 ? 'pointer-events: none' : '' }}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.603" height="9.742"
                                    viewBox="0 0 5.603 9.742" class="svg replaced-svg">
                                    <path id="Path_26" data-name="Path 26"
                                        d="M122.5,4.747,118.338,8.9a.349.349,0,1,1-.493-.494l3.915-3.9L117.845.6A.349.349,0,0,1,118.338.1L122.5,4.253a.349.349,0,0,1,0,.494Z"
                                        transform="translate(-117.35 0.35)" fill="currentColor" stroke="currentColor"
                                        stroke-width="0.7"></path>
                                </svg>
                            </a>
                        </li>
                    @endif
                </ul>
            </div>
        @endif
    @endif
    <!-- End of comment Pagination -->
@endif
