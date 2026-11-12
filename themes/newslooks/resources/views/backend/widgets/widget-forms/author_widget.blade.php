@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $author_id = isset($value) && isset($value['author_id']) ? $value['author_id'] : null;
    $author_designation = isset($value) && isset($value['author_designation']) ? $value['author_designation'] : '';
    $author_image = isset($value) && isset($value['author_image']) ? $value['author_image'] : null;
    $users = \Core\Models\User::where('status', config('settings.general_status.active'))
        ->select('id', 'name')
        ->get();
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
        <label for="author_id">{{ translate('Select a User for Authur Widget') }}</label>
        <select class="form-control mt-1" name="author_id" id="author_id" @if (!empty($lang) && $lang != getDefaultLang()) disabled @endif>
            @foreach ($users as $user)
                <option value="{{ $user->id }}" @selected($author_id && $author_id == $user->id)>{{ $user->name }}
                </option>
            @endforeach
        </select>
    </div>

    <div class="form-group">
        <label for="author_designation">{{ translate('Author Designation') }}</label>
        <input type="text" name="author_designation" id="author_designation" class="form-control"
            value="{{ $author_designation }}">
    </div>

    <div class="form-row mb-20 @if (!empty($lang) && $lang != getDefaultLang()) area-disabled @endif">
        <div class="col-sm-12">
            <label class="font-14 bold black">{{ translate('Author Image') }} </label>
        </div>
        <div class="col-md-12">
            @include('core::base.includes.media.media_input', [
                'input' => 'author_image',
                'data' => $author_image,
            ])
        </div>
    </div>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')
</form>
