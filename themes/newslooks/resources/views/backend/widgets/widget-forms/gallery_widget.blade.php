@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $blog_type = isset($value) && isset($value['blog_type']) ? $value['blog_type'] : null;
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

    <div class="form-group @if (!empty($lang) && $lang != getdefaultlang()) area-disabled @endif">
        <label for="blog_type">{{ translate('Select Post Type') }}</label>
        <select class="form-control" name="blog_type" id="blog_type"
            @if (!empty($lang) && $lang != getdefaultlang()) disabled @endif>
            <option value="recent">Recent</option>
            <option value="feature">Featured</option>
            <option value="popular">Popular</option>
            <option value="most_view">Most Viewed</option>
            <option value="most_comment">Most Commented</option>
        </select>
    </div>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
