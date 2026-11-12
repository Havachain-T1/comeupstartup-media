@php
    $newsletter_title = isset($value) && isset($value['newsletter_title']) ? $value['newsletter_title'] : '';
    $newsletter_subtitle = isset($value) && isset($value['newsletter_subtitle']) ? $value['newsletter_subtitle']:'';
    $email_placeholder = isset($value) && isset($value['email_placeholder']) ? $value['email_placeholder']:'';
    $button_text = isset($value) && isset($value['button_text']) ? $value['button_text']:'';
@endphp
<form action="#" class=" widget_input_field_form px-3 py-3 bg-white"
    onsubmit="event.preventDefault(); widgetInputFormSubmit(this);">

    {{-- Translated Language --}}
    @include('theme/newslooks::backend.widgets.includes.widget-form-language')

    <div class="form-group">
        <label for="newsletter_title" class="">{{ translate('Newsletter Title') }}</label>
        <input type="text" class="form-control" id="newsletter_title" name="newsletter_title"
            placeholder="{{ translate('Newsletter Title') }}" value="{{ $newsletter_title }}">
    </div>

    <div class="form-group">
        <label for="newsletter_subtitle">{{ translate('Newsletter Subtitle') }}</label>
        <input type="text" class="form-control" id="newsletter_subtitle" name="newsletter_subtitle"
            placeholder="{{ translate('Newsletter Subtitle') }}" value="{{ $newsletter_subtitle }}">
    </div>

    <div class="form-group">
        <label for="email_placeholder" class="">{{ translate('Email Placeholder') }}</label>
        <input type="text" class="form-control" id="email_placeholder" name="email_placeholder"
            placeholder="{{ translate('Email Placeholder') }}" value="{{ $email_placeholder }}">
    </div>

    <div class="form-group">
        <label for="button_text" class="">{{ translate('Button Text') }}</label>
        <input type="text" class="form-control" id="button_text" name="button_text"
            placeholder="{{ translate('Button Text') }}" value="{{ $button_text }}">
    </div>

    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
