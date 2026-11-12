@php
    $search_placeholder = isset($value) && isset($value['search_placeholder']) ? $value['search_placeholder'] : '';
@endphp
<form action="#" class="widget_input_field_form px-3 py-3 bg-white"
    onsubmit="event.preventDefault(); widgetInputFormSubmit(this);">

    {{-- Translated Language --}}
    @include('theme/newslooks::backend.widgets.includes.widget-form-language')

    <div class="form-group">
        <label for="search_placeholder" class="">{{ translate('Search Placeholder') }}</label>
        <input type="text" class="form-control" id="search_placeholder" name="search_placeholder"
            placeholder="{{ translate('Search Placeholder') }}" value="{{ $search_placeholder }}">
    </div>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
