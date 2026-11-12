@extends('portal.layout')
@section('title', __('Company invitation'))
@section('portal')
    <div class="cus-card" style="max-width:560px;margin:0 auto">
        <div class="cus-card__body">
            <h1 style="font-size:1.375rem">{{ __('Join :company', ['company' => $invitation->company->name]) }}</h1>
            <p>{{ __('You have been invited to join as :role.', ['role' => $invitation->roleEnum()->label()]) }}</p>
            @if (strtolower(auth()->user()->email) !== strtolower($invitation->email))
                <div class="cus-alert cus-alert--warning">{{ __('This invitation was sent to a different email address. Sign in with that account to accept it.') }}</div>
            @else
                <form method="post" action="{{ route('company.invitations.accept', $token) }}">@csrf
                    <button class="cus-btn cus-btn--primary" type="submit">{{ __('Accept invitation') }}</button></form>
            @endif
        </div>
    </div>
@endsection
