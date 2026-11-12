@php
    $description = isset($value['description']) ? $value['description'] : '';
    $address = isset($value['address']) ? $value['address'] : '';
    $mail = isset($value['mail']) ? $value['mail'] : null;
    $phone = isset($value['phone']) ? $value['phone'] : null;
@endphp

<!-- About Widget -->
<div class="widget widget_about">
    @isset($value['widget_title'])
        <!-- Section Title -->
        <div class="section-title has-bg-shape shape--two mb-30">
            <h2 class="c1">{{ $value['widget_title'] }}</h2>
        </div>
        <!-- End Section Title -->
    @endisset

    <p>{{ $description }}</p>

    <ul class="about-info">
        <li>
            <img class="mx-10 svg c1" src="{{ asset('themes/newslooks/public/') }}/img/icon/map-marker.svg" alt="map">
            <span class="media-body">{{ $address }}</span>
        </li>
        <li>
            <img class="mx-10 svg c1" src="{{ asset('themes/newslooks/public/') }}/img/icon/envelope.svg" alt="envelop">
            <span class="media-body"><a href="mailto:{{ $mail }}">{{ $mail }}</a></span>
        </li>
        <li>
            <img class="mx-10 svg c1" src="{{ asset('themes/newslooks/public/') }}/img/icon/phone.svg" alt="phone">
            <span class="media-body"><a href="tel:{{ $phone }}">{{ $phone }}</a></span>
        </li>
    </ul>
</div>
<!-- End About Widget -->