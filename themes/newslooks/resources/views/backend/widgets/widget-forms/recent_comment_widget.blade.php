@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $number_of_comments = isset($value) && isset($value['number_of_comments']) ? $value['number_of_comments'] : '';
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
        <label for="number_of_comments">{{ translate('Number of Comments') }}</label>
        <input type="number" min="1" step="1" required class="form-control" id="number_of_comments" name="number_of_comments"
            placeholder="{{ translate('Number of Posts') }}" value="{{ $number_of_comments }}"
            @if (!empty($lang) && $lang != getDefaultLang()) disabled @endif>
    </div>

    <div class="px-3 row justify-content-between">
        <div>
            <a href="javascript:;void(0)" class="text-danger"
                onclick="removeFromSidebar(this)">{{ translate('Delete') }}</a>
            <span class="mx-1">|</span>
            <a href="javascript:;void(0)" class="text-info"
                onclick="closeSidebarDropMenu(this)">{{ translate('Done') }}</a>
        </div>
        <button type="submit" class="btn btn-primary sm">{{ translate('Save') }}</button>
    </div>
</form>
