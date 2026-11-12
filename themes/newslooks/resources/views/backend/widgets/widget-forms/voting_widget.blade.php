@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $vote_id = isset($value) && isset($value['vote_id']) ? $value['vote_id'] : null;

    $votes = Theme\NewsLooks\Models\Vote::select('id', 'title')->get();
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
        <label for="vote_id">{{ translate('Select Vote') }}</label>
        <select class="form-control mt-1" name="vote_id" id="vote_id"
            @if (!empty($lang) && $lang != getDefaultLang()) disabled @endif>
            @foreach ($votes as $vote)
                <option value="{{ $vote->id }}" @selected($vote_id && $vote_id == $vote->id)>{{ $vote->title }}
                </option>
            @endforeach
        </select>
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
