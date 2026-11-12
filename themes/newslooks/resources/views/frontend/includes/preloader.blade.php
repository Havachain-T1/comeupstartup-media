@php
    $preloader = getThemeOption('preloader', $active_theme->id);
@endphp

@if (isset($preloader['preloader_field']) && $preloader['preloader_field'] == 1)

    <div class="preloader fixed-top w-100 h-100 align-items-center justify-content-center">

        @if (isset($preloader['preloader_style_type']) && $preloader['preloader_style_type'] == 'custom')
            @if (isset($preloader['custom_preloader_type']) &&
                    $preloader['custom_preloader_type'] == 'image' &&
                    isset($preloader['preloader_image']))
                <img src="{{ getFilePath($preloader['preloader_image']) }}" alt="Preloader Image">
            @endif
            @if (isset($preloader['custom_preloader_type']) &&
                    $preloader['custom_preloader_type'] == 'text' &&
                    isset($preloader['preloader_html']))
                {!! xss_clean($preloader['preloader_html']) !!}
            @endif
        @else
            <div class="preloader-inner"></div>
        @endif

    </div>
@endif
