@extends('portal.layout')
@section('title', __('Verification'))
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head"><div><h1>{{ __('Company verification') }}</h1><p>@include('company._verification_badge')</p></div></div>
    @if ($company->verification_status === 'pending')
        <div class="cus-alert cus-alert--warning">{{ __('Your documents are being reviewed by our editorial team.') }}</div>
    @elseif ($company->isVerified())
        <div class="cus-alert cus-alert--success">{{ __('Your company is verified.') }}</div>
    @else
        <form class="cus-card" method="post" action="{{ route('company.verification.store', $company) }}" enctype="multipart/form-data">
            @csrf
            <div class="cus-card__head"><h2>{{ __('Upload documents') }}</h2></div>
            <div class="cus-card__body cus-form">
                <p class="cus-hint">{{ __('PDF, JPG or PNG up to 5 MB each. Documents are stored privately and are only visible to our verification team.') }}</p>
                @foreach ($types as $type => $label)
                    <div class="cus-field"><label for="doc-{{ $type }}">{{ __($label) }}</label>
                        <input class="cus-input" type="file" id="doc-{{ $type }}" name="documents[{{ $type }}]" accept=".pdf,.jpg,.jpeg,.png">
                        @error("documents.$type")<div class="cus-error">{{ $message }}</div>@enderror</div>
                @endforeach
                <div class="cus-field"><label for="notes">{{ __('Notes for the reviewer') }}</label><textarea class="cus-input" id="notes" name="notes" maxlength="2000">{{ old('notes') }}</textarea></div>
                <div class="cus-actions"><button class="cus-btn cus-btn--primary" type="submit">{{ __('Submit for review') }}</button></div>
            </div>
        </form>
    @endif
    @if ($verifications->isNotEmpty())
        <div class="cus-card"><div class="cus-card__head"><h2>{{ __('History') }}</h2></div><div class="cus-card__body"><ul class="cus-timeline">
            @foreach ($verifications as $v)
                <li><strong>{{ ucfirst($v->status) }}</strong> · {{ $v->documents->count() }} {{ __('document(s)') }}<small>{{ optional($v->submitted_at)->toDayDateTimeString() }}</small>
                    @if ($v->reviewer_notes)<div>{{ $v->reviewer_notes }}</div>@endif</li>
            @endforeach
        </ul></div></div>
    @endif
@endsection
