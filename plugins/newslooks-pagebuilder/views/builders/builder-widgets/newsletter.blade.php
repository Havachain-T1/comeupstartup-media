@php
    $subtitle = isset($data['short_desc_t_']) ? $data['short_desc_t_'] : '';
    $title = isset($data['title_t_']) ? $data['title_t_'] : '';
    $placeholder = isset($data['email_placeholder_t_']) ? $data['email_placeholder_t_'] : '';
    $button = isset($data['btn_text_t_']) ? $data['btn_text_t_'] : '';
@endphp
<!-- Widget Newsletter -->
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
<!-- End Newsletter -->
