@extends('portal.layout')
@section('title', __('Team'))
@section('sidebar') @include('company._nav') @endsection
@section('portal')
    <div class="cus-page-head"><div><h1>{{ __('Team') }}</h1><p>{{ __('People who can work on :company.', ['company' => $company->name]) }}</p></div></div>
    @if (session('invite_link'))
        <div class="cus-alert cus-alert--info">{{ __('Invitation link (share only with the invitee):') }} <code>{{ session('invite_link') }}</code></div>
    @endif
    <div class="cus-card">
        <table class="cus-table">
            <thead><tr><th>{{ __('Name') }}</th><th>{{ __('Email') }}</th><th>{{ __('Role') }}</th><th><span class="cus-sr-only">{{ __('Actions') }}</span></th></tr></thead>
            <tbody>
                @foreach ($members as $row)
                    <tr>
                        <td data-label="{{ __('Name') }}">{{ $row->user->name ?? '—' }} @if ($row->is($member))<span class="cus-badge">{{ __('You') }}</span>@endif</td>
                        <td data-label="{{ __('Email') }}">{{ $row->user->email ?? '—' }}</td>
                        <td data-label="{{ __('Role') }}">
                            @if ($member->can('manage_members') && !$row->is($member) && in_array($row->roleEnum(), $member->roleEnum()->assignableRoles(), true))
                                <form method="post" action="{{ route('company.members.update', [$company, $row]) }}" class="cus-actions">
                                    @csrf @method('PUT')
                                    <label class="cus-sr-only" for="role-{{ $row->id }}">{{ __('Role') }}</label>
                                    <select class="cus-input" id="role-{{ $row->id }}" name="role" style="width:auto">
                                        @foreach ($member->roleEnum()->assignableRoles() as $role)
                                            <option value="{{ $role->value }}" @selected($row->role === $role->value)>{{ $role->label() }}</option>
                                        @endforeach
                                    </select>
                                    <button class="cus-btn cus-btn--secondary cus-btn--sm" type="submit">{{ __('Update') }}</button>
                                </form>
                            @else
                                {{ $row->roleEnum()->label() }}
                            @endif
                        </td>
                        <td data-label="">
                            @if ($row->is($member) || $member->can('manage_members'))
                                <form method="post" action="{{ route('company.members.destroy', [$company, $row]) }}" onsubmit="return confirm(@json(__('Are you sure?')))">
                                    @csrf @method('DELETE')
                                    <button class="cus-btn cus-btn--danger cus-btn--sm" type="submit">{{ $row->is($member) ? __('Leave') : __('Remove') }}</button>
                                </form>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    @if ($member->can('manage_members'))
        <div class="cus-card">
            <div class="cus-card__head"><h2>{{ __('Invite a team member') }}</h2></div>
            <form class="cus-card__body cus-form" method="post" action="{{ route('company.members.invite', $company) }}">
                @csrf
                <div class="cus-form-row">
                    <div class="cus-field"><label for="invite-email">{{ __('Email') }}</label><input class="cus-input" type="email" id="invite-email" name="email" value="{{ old('email') }}" required></div>
                    <div class="cus-field"><label for="invite-role">{{ __('Role') }}</label>
                        <select class="cus-input" id="invite-role" name="role">
                            @foreach ($member->roleEnum()->assignableRoles() as $role)
                                <option value="{{ $role->value }}" @selected(old('role', 'viewer') === $role->value)>{{ $role->label() }}</option>
                            @endforeach
                        </select></div>
                </div>
                <div class="cus-actions"><button class="cus-btn cus-btn--primary" type="submit">{{ __('Send invitation') }}</button></div>
            </form>
            @if ($invitations->isNotEmpty())
                <table class="cus-table">
                    <thead><tr><th>{{ __('Pending invitation') }}</th><th>{{ __('Role') }}</th><th>{{ __('Expires') }}</th><th><span class="cus-sr-only">{{ __('Actions') }}</span></th></tr></thead>
                    <tbody>
                        @foreach ($invitations as $invitation)
                            <tr>
                                <td data-label="{{ __('Email') }}">{{ $invitation->email }}</td>
                                <td data-label="{{ __('Role') }}">{{ $invitation->roleEnum()->label() }}</td>
                                <td data-label="{{ __('Expires') }}">{{ $invitation->expires_at->toFormattedDateString() }}</td>
                                <td data-label=""><form method="post" action="{{ route('company.members.invitations.revoke', [$company, $invitation]) }}">@csrf @method('DELETE')<button class="cus-btn cus-btn--secondary cus-btn--sm" type="submit">{{ __('Revoke') }}</button></form></td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            @endif
        </div>
    @endif
@endsection
