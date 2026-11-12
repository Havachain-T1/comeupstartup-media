@php
    $menu_groups = getAllMenuGroups();
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $menu_group_id = isset($value) && isset($value['menu_group_id']) ? $value['menu_group_id'] : null;
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
        <label for="menu_group_id">{{ translate('Select Menu Group') }}</label>
        <select class="form-control" name="menu_group_id" id="menu_group_id"
            @if (!empty($lang) && $lang != getdefaultlang()) disabled @endif>
            @foreach ($menu_groups as $group)
                <option value="{{ $group->id }}"
                    @selected($menu_group_id != null && $menu_group_id == $group->id)>{{ $group->name }}
                </option>
            @endforeach
        </select>
    </div>


    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
