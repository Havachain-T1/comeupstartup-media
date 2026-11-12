@php
    $gdpr = getThemeOption('gdpr', $active_theme->id);
@endphp

@if (isset($gdpr['gdpr_status']) && $gdpr['gdpr_status'] == 1)
    <div class="gdpr-box position-{{ isset($gdpr['gdpr_position_class']) ? $gdpr['gdpr_position_class'] : 'left'  }}"
        style="{{ isset($gdpr['gdpr_bg_color']) ? 'background-color: '.$gdpr['gdpr_bg_color'].';' : '' }}">

        <div class="mb-15">{!! isset($gdpr['gdpr_message']) ? $gdpr['gdpr_message'] : 'black'  !!}</div>
        <button class="btn mt-3 px-20 py-10 font-14 accept-cookie">{{ isset($gdpr['gdpr_btn_label']) ? $gdpr['gdpr_btn_label'] : '' }}</button>

    </div>
@endif
