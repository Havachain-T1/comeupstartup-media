@php($m = app()->bound('currentCompanyMember') ? app('currentCompanyMember') : null)
<a href="{{ route('company.show', $company) }}" @if (Route::is('company.show')) aria-current="page" @endif>{{ __('Overview') }}</a>
@if (Route::has('brand-press.index') && $m && $m->can('view'))
    <a href="{{ route('brand-press.index', $company) }}" @if (Route::is('brand-press.*')) aria-current="page" @endif>{{ __('Brand Press') }}</a>
@endif
<a href="{{ route('company.members.index', $company) }}" @if (Route::is('company.members.*')) aria-current="page" @endif>{{ __('Team') }}</a>
@if ($m && $m->can('view_billing') && Route::has('company.orders.index'))
    <a href="{{ route('company.orders.index', $company) }}" @if (Route::is('company.orders.*')) aria-current="page" @endif>{{ __('Orders & invoices') }}</a>
@endif
@if ($m && $m->can('manage_verification'))
    <a href="{{ route('company.verification.create', $company) }}" @if (Route::is('company.verification.*')) aria-current="page" @endif>{{ __('Verification') }}</a>
@endif
@if ($m && $m->can('update_profile'))
    <a href="{{ route('company.edit', $company) }}" @if (Route::is('company.edit')) aria-current="page" @endif>{{ __('Company profile') }}</a>
@endif
<a href="{{ route('company.index') }}">{{ __('All companies') }}</a>
