@php
    $title = isset($data['title_t_']) ? $data['title_t_'] : '';
    $name_placeholder = isset($data['name_placeholder_t_']) ? $data['name_placeholder_t_'] : '';
    $email_placeholder = isset($data['email_placeholder_t_']) ? $data['email_placeholder_t_'] : '';
    $subject_placeholder = isset($data['subject_placeholder_t_']) ? $data['subject_placeholder_t_'] : '';
    $message_placeholder = isset($data['message_placeholder_t_']) ? $data['message_placeholder_t_'] : '';
    $button_text = isset($data['button_text_t_']) ? $data['button_text_t_'] : front_translate('Send Message');
    $alignment = isset($data['btn_alignment']) ? $data['btn_alignment'] : 'left';
@endphp

<div class="contact-form-wrap">
    <div class="section-title has-bg-shape shape--two mb-30">
        <h2>{{ $title }}</h2>
    </div>
    <form action="{{ route('theme.newslooks.contact.submit') }}" method="POST" class="contact-form">
        @csrf
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <input type="text" name="name" class="theme-input-style mb-20" placeholder="{{ $name_placeholder }}" required="">
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <input type="email" name="email" class="theme-input-style mb-20" placeholder="{{ $email_placeholder }}" required="">
                </div>
            </div>
            <div class="col-12">
                <div class="form-group">
                    <input type="text" name="subject" class="theme-input-style mb-20" placeholder="{{ $subject_placeholder }}">
                </div>
            </div>
            <div class="col-lg-12">
                <textarea class="theme-input-style mb-30" name="message" placeholder="{{ $message_placeholder }}" required></textarea>
            </div>
            <div class="col-lg-12 mt-2">
                <div class="d-flex justify-content-{{ $alignment }} flex-wrap">
                    <button type="submit" class="btn">{{ $button_text }}</button>
                </div>
            </div>
        </div>
    </form>
</div>