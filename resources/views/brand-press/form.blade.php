@extends('portal.layout')
@section('title', $release->exists ? __('Edit announcement') : __('New announcement'))
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head"><div><div class="cus-breadcrumb"><a href="{{ route('brand-press.index', $company) }}">{{ __('Brand Press') }}</a> / {{ $release->exists ? __('Edit') : __('New') }}</div>
        <h1>{{ $release->exists ? __('Edit announcement') : __('New announcement') }}</h1></div></div>
    @if ($release->status === 'changes_requested' && ($note = $release->events()->where('to_status', 'changes_requested')->latest('id')->value('note')))
        <div class="cus-alert cus-alert--warning"><strong>{{ __('Editor feedback:') }}</strong> {{ $note }}</div>
    @endif
    <form class="cus-card" method="post" action="{{ $release->exists ? route('brand-press.update', [$company, $release]) : route('brand-press.store', $company) }}" data-cus-form>
        @csrf @if ($release->exists) @method('PUT') @endif
        <div class="cus-card__body cus-form">
            <div class="cus-field"><label for="title">{{ __('Headline') }} *</label>
                <input class="cus-input" id="title" name="title" value="{{ old('title', $release->title) }}" required minlength="10" maxlength="225" @error('title') aria-invalid="true" @enderror>
                @error('title')<div class="cus-error">{{ $message }}</div>@enderror</div>
            <div class="cus-field"><label for="summary">{{ __('Summary') }}</label>
                <textarea class="cus-input" id="summary" name="summary" maxlength="500" style="min-height:4.5rem">{{ old('summary', $release->summary) }}</textarea>
                <div class="cus-hint">{{ __('One or two sentences shown in listings and search results.') }}</div></div>
            <div class="cus-field"><label for="body">{{ __('Announcement') }} *</label>
                <textarea class="cus-input" id="body" name="body" required minlength="200" style="min-height:16rem" @error('body') aria-invalid="true" @enderror>{{ old('body', $release->body) }}</textarea>
                <div class="cus-hint">{{ __('At least 200 characters. Separate paragraphs with a blank line. Links, bold and lists are kept; scripts and styling are removed.') }}</div>
                @error('body')<div class="cus-error">{{ $message }}</div>@enderror</div>
            @includeIf('brand-press._ai_assist')
            <div class="cus-form-row">
                <div class="cus-field"><label for="contact_name">{{ __('Media contact name') }}</label><input class="cus-input" id="contact_name" name="contact_name" value="{{ old('contact_name', $release->contact_name) }}"></div>
                <div class="cus-field"><label for="contact_email">{{ __('Media contact email') }}</label><input class="cus-input" type="email" id="contact_email" name="contact_email" value="{{ old('contact_email', $release->contact_email) }}"></div>
            </div>
            <input type="hidden" name="ai_assisted" id="ai_assisted" value="{{ old('ai_assisted', $release->ai_assisted ? 1 : 0) }}">
            <div class="cus-actions"><button class="cus-btn cus-btn--primary" type="submit">{{ __('Save draft') }}</button>
                <a class="cus-btn cus-btn--secondary" href="{{ $release->exists ? route('brand-press.show', [$company, $release]) : route('brand-press.index', $company) }}">{{ __('Cancel') }}</a></div>
        </div>
    </form>
@endsection
