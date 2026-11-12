@php
    $widget_title = isset($value) && isset($value['widget_title']) ? $value['widget_title'] : '';
    $description = isset($value) && isset($value['description']) ? $value['description'] : '';
    $address = isset($value) && isset($value['address']) ? $value['address'] : '';
    $mail = isset($value) && isset($value['mail']) ? $value['mail'] : '';
    $phone = isset($value) && isset($value['phone']) ? $value['phone'] : '';
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

    <div class="form-group">
        <label for="description">{{ translate('Description') }}</label>
        <textarea name="description" id="description" class="theme-input-style style--two"
            placeholder="{{ translate('Description') }}">{{ $description }}</textarea>
    </div>

    <div class="form-group">
        <label for="address" class="">{{ translate('Address') }}</label>
        <textarea name="address" id="address" class="theme-input-style style--two" placeholder="{{ translate('Address') }}"
        >{{ $address }}</textarea>
    </div>

    <div class="form-group @if (!empty($lang) && $lang != getdefaultlang()) area-disabled @endif">
        <label for="mail" class="">{{ translate('Mail') }}</label>
        <input type="text" class="form-control" id="mail" name="mail" placeholder="{{ translate('Mail') }}"
            value="{{ $mail }}" @if (!empty($lang) && $lang != getdefaultlang()) disabled @endif>
    </div>

    <div class="form-group @if (!empty($lang) && $lang != getdefaultlang()) area-disabled @endif">
        <label for="phone" class="">{{ translate('Phone') }}</label>
        <input type="text" class="form-control" id="phone" name="phone" placeholder="{{ translate('Phone') }}"
            value="{{ $phone }}" @if (!empty($lang) && $lang != getdefaultlang()) disabled @endif>
    </div>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
