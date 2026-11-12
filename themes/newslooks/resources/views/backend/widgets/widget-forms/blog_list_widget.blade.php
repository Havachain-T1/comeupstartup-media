@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $number_of_blogs = isset($value) && isset($value['number_of_blogs']) ? $value['number_of_blogs'] : '';
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

    <div class="form-group @if (!empty($lang) && $lang != getDefaultLang()) area-disabled @endif">
        <label for="number_of_blogs">{{ translate('Number of Posts') }}</label>
        <input type="number" min="1" step="1" required class="form-control" id="number_of_blogs" name="number_of_blogs"
            placeholder="{{ translate('Number of Posts') }}" value="{{ $number_of_blogs }}"
            @if (!empty($lang) && $lang != getDefaultLang()) disabled @endif>
    </div>

    <div class="form-group @if (!empty($lang) && $lang != getDefaultLang()) area-disabled @endif">
        <label for="number_of_blogs">{{ translate('Type of Posts') }}</label>
        <select name="type_of_blogs" id="type_of_blogs" class="form-control" @if (!empty($lang) && $lang != getDefaultLang()) disabled @endif>
            <option value="recent">Recent</option>
            <option value="feature">Featured</option>
            <option value="popular">Popular</option>
            <option value="most_view">Most Viewed</option>
            <option value="most_comment">Most Commented</option>
        </select>
    </div>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
