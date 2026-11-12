@extends('portal.layout')
@section('title', __('Your companies'))
@section('portal')
    <div class="cus-page-head">
        <div><h1>{{ __('Your companies') }}</h1><p>{{ __('Manage the organisations you belong to, their team and their Brand Press announcements.') }}</p></div>
        <a class="cus-btn cus-btn--primary" href="{{ route('company.create') }}">{{ __('Register a company') }}</a>
    </div>
    <div class="cus-card">
        @if ($memberships->isEmpty())
            <div class="cus-empty">
                <h3>{{ __('You are not part of a company yet') }}</h3>
                <p>{{ __('Register your company to submit announcements and manage your team.') }}</p>
                <a class="cus-btn cus-btn--primary" href="{{ route('company.create') }}">{{ __('Register a company') }}</a>
            </div>
        @else
            <table class="cus-table">
                <thead><tr><th>{{ __('Company') }}</th><th>{{ __('Your role') }}</th><th>{{ __('Status') }}</th><th><span class="cus-sr-only">{{ __('Actions') }}</span></th></tr></thead>
                <tbody>
                    @foreach ($memberships as $membership)
                        <tr>
                            <td data-label="{{ __('Company') }}"><strong>{{ $membership->company->name }}</strong></td>
                            <td data-label="{{ __('Your role') }}">{{ $membership->roleEnum()->label() }}</td>
                            <td data-label="{{ __('Status') }}">@include('company._verification_badge', ['company' => $membership->company])</td>
                            <td data-label=""><a class="cus-btn cus-btn--secondary cus-btn--sm" href="{{ route('company.show', $membership->company) }}">{{ __('Open') }}</a></td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>
    @if ($invitations->isNotEmpty())
        <div class="cus-card">
            <div class="cus-card__head"><h2>{{ __('Pending invitations') }}</h2></div>
            <div class="cus-card__body">
                @foreach ($invitations as $invitation)
                    <p>{{ __(':company invited you as :role.', ['company' => $invitation->company->name, 'role' => $invitation->roleEnum()->label()]) }}
                        {{ __('Use the link in your invitation email to join.') }}</p>
                @endforeach
            </div>
        </div>
    @endif
@endsection
