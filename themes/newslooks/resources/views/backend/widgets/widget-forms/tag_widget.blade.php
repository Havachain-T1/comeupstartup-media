@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $number_of_tags = isset($value) && isset($value['number_of_tags']) ? $value['number_of_tags'] : '';
@endphp
<form action="#" class=" widget_input_field_form px-3 py-3 bg-white"
    onsubmit="event.preventDefault(); widgetInputFormSubmit(this);">

    {{-- Translated Language --}}
    @include('theme/newslooks::backend.widgets.includes.widget-form-language')

    <div class="form-group">
        <label for="widget_title" class="">{{ translate('Widget Title') }}</label>
        <input type="text" class="form-control" id="widget_title" name="widget_title"
            placeholder="{{ translate('Widget Title') }}" value="{{ $widget_title }}">
    </div>

    <div class="form-group @if (!empty($lang) && $lang != getDefaultLang()) area-disabled @endif">
        <label for="number_of_tags">{{ translate('Number of Tags') }}</label>
        <input type="number" min="1" step="1" required class="form-control" id="number_of_tags" name="number_of_tags"
            placeholder="{{ translate('Number of Tag') }}" value="{{ $number_of_tags }}"
            @if (!empty($lang) && $lang != getDefaultLang()) disabled @endif>
    </div>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')
</form>
