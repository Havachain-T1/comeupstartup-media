@extends('core::base.layouts.master')
@section('title') {{ $release->title }} @endsection
@section('custom_css') <link rel="stylesheet" href="{{ asset('public/css/portal/portal.css') }}"> @endsection
@section('main_content')
    <div class="cus-portal" style="padding-top:0">
        <div class="cus-page-head"><div><div class="cus-breadcrumb"><a href="{{ route('admin.brand-press.index') }}">{{ translate('Brand Press') }}</a></div>
            <h1>{{ $release->title }}</h1><p>@include('brand-press._status') · {{ $release->company->name }} @include('company._verification_badge', ['company' => $release->company])</p></div></div>
        @if (session('success'))<div class="cus-alert cus-alert--success" role="status">{{ session('success') }}</div>@endif
        @if ($errors->any())<div class="cus-alert cus-alert--danger" role="alert">{{ $errors->first() }}</div>@endif
        @if ($release->ai_assisted)<div class="cus-alert cus-alert--info">{{ translate('The company used AI writing assistance for this draft. Check facts and claims carefully.') }}</div>@endif
        <div class="cus-layout" style="grid-template-columns:1fr 320px">
            <div>
                <div class="cus-card"><div class="cus-card__body">@if ($release->summary)<p><strong>{{ $release->summary }}</strong></p>@endif{!! clean_press_html(str_contains($release->body, '<') ? $release->body : nl2br(e($release->body))) !!}</div></div>
                <div class="cus-card"><div class="cus-card__head"><h2>{{ translate('History') }}</h2></div><div class="cus-card__body"><ul class="cus-timeline">
                    @foreach ($release->events->reverse() as $event)<li><strong>{{ \App\Models\BrandPress\PressRelease::LABELS[$event->to_status] ?? $event->to_status }}</strong>@if ($event->note) — {{ $event->note }}@endif<small>{{ $event->created_at->toDayDateTimeString() }}@if ($event->actor) · {{ $event->actor->name }}@endif</small></li>@endforeach
                </ul></div></div>
            </div>
            <aside>
                <div class="cus-card"><div class="cus-card__head"><h2>{{ translate('Editorial decision') }}</h2></div>
                    <form class="cus-card__body cus-form" method="post" action="{{ route('admin.brand-press.action', $release) }}">@csrf
                        <div class="cus-field"><label for="note">{{ translate('Note to the company') }}</label><textarea class="cus-input" id="note" name="note" style="min-height:5rem"></textarea></div>
                        @if ($workflow->allowed($release, 'scheduled'))<div class="cus-field"><label for="scheduled_for">{{ translate('Schedule for') }}</label><input class="cus-input" type="datetime-local" id="scheduled_for" name="scheduled_for"></div>@endif
                        <div class="cus-actions">
                            @if ($workflow->allowed($release, 'under_review') && $release->status === 'paid')<button class="cus-btn cus-btn--primary" name="action" value="start_review">{{ translate('Start review') }}</button>@endif
                            @if ($workflow->allowed($release, 'approved'))<button class="cus-btn cus-btn--primary" name="action" value="approve">{{ translate('Approve') }}</button>@endif
                            @if ($workflow->allowed($release, 'changes_requested'))<button class="cus-btn cus-btn--secondary" name="action" value="request_changes">{{ translate('Request changes') }}</button>@endif
                            @if ($workflow->allowed($release, 'rejected'))<button class="cus-btn cus-btn--danger" name="action" value="reject">{{ translate('Reject') }}</button>@endif
                            @if ($workflow->allowed($release, 'published'))<button class="cus-btn cus-btn--primary" name="action" value="publish">{{ translate('Publish now') }}</button>@endif
                            @if ($workflow->allowed($release, 'scheduled'))<button class="cus-btn cus-btn--secondary" name="action" value="schedule">{{ translate('Schedule') }}</button>@endif
                            @if ($release->status === 'rejected' && $release->order?->isPaid())<button class="cus-btn cus-btn--danger" name="action" value="refund">{{ translate('Refund payment') }}</button>@endif
                        </div>
                    </form></div>
                <div class="cus-card"><div class="cus-card__body"><dl class="cus-dl">
                    <dt>{{ translate('Package') }}</dt><dd>{{ $release->package->name ?? '—' }}</dd>
                    <dt>{{ translate('Order') }}</dt><dd>{{ $release->order->number ?? '—' }} @if ($release->order)({{ ucfirst(str_replace('_', ' ', $release->order->status)) }})@endif</dd>
                    <dt>{{ translate('Author') }}</dt><dd>{{ $release->author->name ?? '—' }}</dd>
                    <dt>{{ translate('Media contact') }}</dt><dd>{{ $release->contact_name ?: '—' }} {{ $release->contact_email }}</dd>
                </dl></div></div>
            </aside>
        </div>
    </div>
@endsection
