@php
    $description = isset($data['description_t_']) ? $data['description_t_'] : '';
    $address = isset($data['address_t_']) ? $data['address_t_'] : '';
    $mail = isset($data['mail']) ? $data['mail'] : null;
    $phone = isset($data['phone']) ? $data['phone'] : null;
@endphp

<!-- About Widget -->
@isset($data['title_t_'])
    <!-- Section Title -->
    <div class="section-title has-bg-shape shape--two mb-30">
        <h2 class="c1">{{ $data['title_t_'] }}</h2>
    </div>
    <!-- End Section Title -->
@endisset

<p>{{ $description }}</p>

<ul class="about-info">
    <li>
        <img class="mr-15 svg c1" src="{{ asset('themes/newslooks/public/') }}/img/icon/map-marker.svg" alt="marker">
        <span class="media-body">{{ $address }}</span>
    </li>

    <li>
        <img class="mr-15 svg c1" src="{{ asset('themes/newslooks/public/') }}/img/icon/envelope.svg" alt="envelop">
        <span class="media-body"><a href="mailto:{{ $mail }}">{{ $mail }}</a></span>
    </li>

    <li>
        <img class="mr-15 svg c1" src="{{ asset('themes/newslooks/public/') }}/img/icon/phone.svg" alt="phone">
        <span class="media-body"><a href="tel:{{ $phone }}">{{ $phone }}</a></span>
    </li>
</ul>
<!-- End About Widget -->
