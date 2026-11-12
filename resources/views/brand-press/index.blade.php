@extends('portal.layout')
@section('title', __('Brand Press'))
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head"><div><h1>{{ __('Brand Press') }}</h1><p>{{ __('Announcements are reviewed by our editors before publication. Payment does not guarantee publication.') }}</p></div>
        @if ($member->can('create_content'))<a class="cus-btn cus-btn--primary" href="{{ route('brand-press.create', $company) }}">{{ __('New announcement') }}</a>@endif</div>
    <div class="cus-card">
        @if ($releases->isEmpty())
            <div class="cus-empty"><h3>{{ __('No announcements yet') }}</h3><p>{{ __('Share funding rounds, launches, partnerships and milestones with our readers.') }}</p>
                @if ($member->can('create_content'))<a class="cus-btn cus-btn--primary" href="{{ route('brand-press.create', $company) }}">{{ __('Write your first announcement') }}</a>@endif</div>
        @else
            <table class="cus-table">
                <thead><tr><th>{{ __('Title') }}</th><th>{{ __('Status') }}</th><th>{{ __('Views') }}</th><th>{{ __('Updated') }}</th></tr></thead>
                <tbody>@foreach ($releases as $release)
                    <tr>
                        <td data-label="{{ __('Title') }}"><a href="{{ route('brand-press.show', [$company, $release]) }}">{{ $release->title }}</a></td>
                        <td data-label="{{ __('Status') }}">@include('brand-press._status')</td>
                        <td data-label="{{ __('Views') }}">{{ $release->blog ? number_format($release->blog->views) : '—' }}</td>
                        <td data-label="{{ __('Updated') }}">{{ $release->updated_at->diffForHumans() }}</td>
                    </tr>
                @endforeach</tbody>
            </table>
        @endif
    </div>
    {{ $releases->links() }}
@endsection
