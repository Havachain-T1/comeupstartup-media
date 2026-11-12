@php
    $title = isset($value['newsletter_title']) ? $value['newsletter_title'] : '';
    $subtitle = isset($value['newsletter_subtitle']) ? $value['newsletter_subtitle'] : '';
    $placeholder = isset($value['email_placeholder']) ? $value['email_placeholder'] : '';
    $button = isset($value['button_text']) ? $value['button_text'] : '';
@endphp
<!-- Widget Newsletter -->
<div class="widget widget_newsletter c2-bg bg-cover text-center" data-bg-img="assets/img/theme/newsletter-bg.svg">
    <!-- Title -->
    <div class="newsletter-title mb-30">
        <h3 class="mb-10">{{ $title }}</h3>
        <p>{{ $subtitle }}</p>
    </div>
    <!-- End Title -->

    <form action="{{ route('theme.newslooks.newsletter.store') }}" method="POST">
        @csrf
        <input class="theme-input-style mb-10" type="email" name="email" placeholder="{{ $placeholder }}">
        <button class="btn w-100 d-block bg-white c2" type="submit">{{ $button }}</button>
    </form>
</div>
<!-- End Newsletter -->
