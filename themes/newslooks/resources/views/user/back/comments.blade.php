@extends('core::base.layouts.master')

@section('title')
    {{ front_translate('User Comments') }}
@endsection

@section('custom_css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-30">
                <div class="card-header px-3 py-4">
                    <div class="d-sm-flex justify-content-between align-items-center">
                        <h3 class="font-24">
                            {{ front_translate('Comments') }}
                        </h3>
                    </div>
                </div>
                <div class="card-body">
                    {{-- Comment Filter Buttons --}}
                    <div class="filter_button row mb-4 pl-3">
                        <a href="{{ route('theme.newslooks.user.comments') }}" class="btn sm btn-dark mx-1 my-2">
                            {{ front_translate('All') }}
                        </a>

                        <a href="{{ route('theme.newslooks.user.comments') . '?status=pending' }}"
                            class="btn sm btn-info mx-1 my-2">
                            {{ front_translate('Pending') }}
                        </a>

                        <a href="{{ route('theme.newslooks.user.comments') . '?status=approve' }}" class="btn sm btn-success mx-1 my-2">
                            {{ front_translate('Approve') }}
                        </a>

                        <a href="{{ route('theme.newslooks.user.comments') . '?status=spam' }}" class="btn sm btn-danger mx-1 my-2">
                            {{ front_translate('Spam') }}
                        </a>

                        <a href="{{ route('theme.newslooks.user.comments') . '?status=trash' }}" class="btn sm btn-danger mx-1 my-2">
                            {{ front_translate('Trash') }}
                        </a>

                        @if (request()->input('search'))
                            <span class="ml-3 h4">{{ front_translate('Result For') }} :
                                ({{ request()->input('search') }})</span>
                        @endif

                    </div>
                    {{-- Comment Filter Buttons End --}}
                    <div class="table-responsive">
                        <table class="border-top2 " id="comment_table">
                            <thead>
                                <tr>
                                    <th>{{ front_translate('Comment') }}</th>
                                    <th>{{ front_translate('Blog') }}</th>
                                    <th>{{ front_translate('Status') }}</th>
                                    <th>{{ front_translate('Submitted on') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($comments as $comment)
                                    <tr class="comment_list @if ($comment->status == '2') unapprove @endif">
                                        <td width="450px" class="black">
                                            @if (isset($comment->parent))
                                                @php
                                                    $parent_comment = Core\Models\TlBlogComment::where('id', $comment->parent)->first()->user_name;
                                                @endphp
                                                <span class="d-block mb-3">{{ front_translate('In reply to') }}
                                                    <a href="javascript:void(0)"
                                                        class="text-primary">{{ $parent_comment }}</a>
                                                </span>
                                            @endif
                                            {!! $comment->comment !!}
                                        </td>

                                        <td>
                                            <div class="d-inline-block pl-1">
                                                <a href="{{ route('theme.newslooks.blog.details', $comment->blog->permalink) }}" target="_blank"
                                                    class="text-primary d-block mb-1">{{ mb_substr($comment->blog->translation('name', getLocale()), 0, 35, 'UTF-8') }}</a>
                                            </div>
                                        </td>

                                        <td>
                                            @switch($comment->status)
                                                @case(config('settings.blog_comment_status.approve'))
                                                    <span class="badge badge-success">
                                                        {{ front_translate('Approve') }}
                                                    </span>
                                                @break

                                                @case(config('settings.blog_comment_status.pending'))
                                                    <span class="badge badge-warning">
                                                        {{ front_translate('Pending') }}
                                                    </span>
                                                @break

                                                @case(config('settings.blog_comment_status.spam'))
                                                    <span class="badge badge-danger">
                                                        {{ front_translate('Spam') }}
                                                    </span>
                                                @break

                                                @case(config('settings.blog_comment_status.trash'))
                                                    <span class="badge badge-danger">
                                                        {{ front_translate('Trash') }}
                                                    </span>
                                                @break
                                            @endswitch
                                        </td>

                                        <td>
                                            <span>{{ getFormatedDateTime($comment->comment_date, 'Y/m/d \a\t H:i a') }}</span>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{-- pagination --}}
                        <div class="row ml-2 mt-2 justify-content-between">
                            {{ $comments->onEachSide(1)->appends(request()->input())->links('pagination::bootstrap-5-custom') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Content -->
@endsection

@section('custom_scripts')
@endsection
