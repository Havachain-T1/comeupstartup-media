@php
    $back_to_top = getThemeOption('back_to_top', $active_theme->id);
@endphp

@if (isset($back_to_top['back_to_top_button']) && $back_to_top['back_to_top_button'] == 1)
<button type="button"
    class="back-to-top position-fixed d-inline-flex align-items-center justify-content-center text-white c1-bg p-0 text-white">
    @if (isset($back_to_top['custom_back_to_top_button']) &&
            $back_to_top['custom_back_to_top_button'] == 1 &&
            isset($back_to_top['custom_back_to_top_button_icon']) &&
            $back_to_top['custom_back_to_top_button_icon'] != '')
        <span><i class="fa {{ $back_to_top['custom_back_to_top_button_icon'] }}"></i></span>
    @else
        <span><i class="fa fa-long-arrow-up"></i></span>
    @endif
</button>
@endif