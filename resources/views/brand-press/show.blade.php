@extends('portal.layout')
@section('title', $release->title)
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    @php($flow = ['draft', 'awaiting_payment', 'paid', 'under_review', 'approved', 'published'])
    @php($pos = array_search(in_array($release->status, ['changes_requested']) ? 'under_review' : (in_array($release->status, ['scheduled']) ? 'approved' : $release->status), $flow))
    <div class="cus-page-head"><div><div class="cus-breadcrumb"><a href="{{ route('brand-press.index', $company) }}">{{ __('Brand Press') }}</a></div>
        <h1>{{ $release->title }}</h1><p>@include('brand-press._status')</p></div>
        <div class="cus-actions">
            @if ($release->isEditableByCompany() && $member->can('create_content'))<a class="cus-btn cus-btn--secondary" href="{{ route('brand-press.edit', [$company, $release]) }}">{{ __('Edit') }}</a>@endif
            @if ($release->status === 'changes_requested' && $member->can('submit_content'))
                <form method="post" action="{{ route('brand-press.submit', [$company, $release]) }}">@csrf<button class="cus-btn cus-btn--primary">{{ __('Resubmit for review') }}</button></form>
            @endif
            @if ($release->status === 'awaiting_payment' && $release->order)<a class="cus-btn cus-btn--primary" href="{{ route('company.orders.show', [$company, $release->order]) }}">{{ __('Go to payment') }}</a>@endif
            @if ($release->status === 'published' && $release->blog)<a class="cus-btn cus-btn--primary" href="{{ route('theme.newslooks.blog.details', $release->blog->permalink) }}">{{ __('View article') }}</a>@endif
        </div></div>
    @if ($pos !== false)
        <ol class="cus-steps card" aria-label="{{ __('Progress') }}" style="margin-bottom:1.25rem">
            @foreach ($flow as $i => $step)<li @if ($i < $pos) data-done="true" @elseif ($i === $pos) data-current="true" aria-current="step" @endif>{{ __(\App\Models\BrandPress\PressRelease::LABELS[$step]) }}</li>@endforeach
        </ol>
    @endif
    @if ($release->status === 'published' && $release->blog)
        <div class="cus-grid"><div class="cus-card cus-stat"><div class="cus-stat__label">{{ __('Article views') }}</div><div class="cus-stat__value">{{ number_format($release->blog->views) }}</div></div>
            <div class="cus-card cus-stat"><div class="cus-stat__label">{{ __('Published') }}</div><div class="cus-stat__value" style="font-size:1rem">{{ $release->published_at->toDayDateTimeString() }}</div></div></div>
    @endif
    @if ($release->status === 'draft' && $member->can('submit_content'))
        <form class="cus-card" method="post" action="{{ route('brand-press.submit', [$company, $release]) }}">@csrf
            <div class="cus-card__head"><h2>{{ __('Choose a package and submit') }}</h2></div>
            <div class="cus-card__body cus-form">
                @if ($packages->isEmpty())
                    <div class="cus-alert cus-alert--info">{{ __('Brand Press packages are not available yet.') }}</div>
                @else
                    <fieldset class="cus-grid" style="border:0;padding:0;margin:0"><legend class="cus-sr-only">{{ __('Package') }}</legend>
                        @foreach ($packages as $package)
                            <label class="cus-pkg"><input type="radio" name="package_id" value="{{ $package->id }}" required @checked($loop->first)> <strong>{{ $package->name }}</strong>
                                <div class="cus-pkg__price">{{ $package->priceLabel() }}</div>
                                @if ($package->features)<ul>@foreach ($package->features as $f)<li>{{ $f }}</li>@endforeach</ul>@endif</label>
                        @endforeach
                    </fieldset>
                    <p class="cus-hint">{{ __('Our editors review every announcement after payment. If it is rejected, the payment is refunded.') }}</p>
                    <div class="cus-actions"><button class="cus-btn cus-btn--primary" type="submit">{{ __('Submit and continue to payment') }}</button></div>
                @endif
            </div>
        </form>
    @endif
    <div class="cus-card"><div class="cus-card__head"><h2>{{ __('Preview') }}</h2></div>
        <div class="cus-card__body">@if ($release->summary)<p><strong>{{ $release->summary }}</strong></p>@endif{!! nl2br(e(strip_tags($release->body))) !!}</div></div>
    <div class="cus-card"><div class="cus-card__head"><h2>{{ __('History') }}</h2></div><div class="cus-card__body"><ul class="cus-timeline">
        @foreach ($release->events->reverse() as $event)
            <li><strong>{{ __(\App\Models\BrandPress\PressRelease::LABELS[$event->to_status] ?? $event->to_status) }}</strong>@if ($event->note) — {{ $event->note }}@endif<small>{{ $event->created_at->toDayDateTimeString() }}@if ($event->actor) · {{ $event->actor->name }}@endif</small></li>
        @endforeach
    </ul></div></div>
@endsection
