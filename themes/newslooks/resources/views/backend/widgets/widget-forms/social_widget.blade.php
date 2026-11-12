@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
@endphp

<form action="#" class="widget_input_field_form px-3 py-3 bg-white"
    onsubmit="event.preventDefault(); widgetInputFormSubmit(this);">

    {{-- Translated Language --}}
    @include('theme/newslooks::backend.widgets.includes.widget-form-language')

    <div class="form-group">
        <label for="widget_title" class="">{{ translate('Widget Title') }}</label>
        <input type="text" class="form-control" id="widget_title" name="widget_title"
            placeholder="{{ translate('Widget Title') }}" value="{{ $widget_title }}">
    </div>

    <p>You Can Set Social Options From Here <a href="#" onclick="authorSocialLink()">Social</a></p>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
