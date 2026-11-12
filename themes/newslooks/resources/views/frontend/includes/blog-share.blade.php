@php
    $share_icons = Core\Models\BlogShareOption::where('status', config('settings.general_status.active'))
        ->get()
        ->toArray();
@endphp
@foreach ($share_icons as $value)
    @isset($blog_shares[$value['network']])
        <a href="{{ $blog_shares[$value['network']] }}" target="_blank"
            title="{{ $value['network_name'] }}">{!! $value['icon'] !!}</a>
    @endisset
@endforeach
