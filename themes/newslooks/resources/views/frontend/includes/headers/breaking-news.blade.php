@php
    $bg =
        isset($headerOption['header_' . $header . '_breaking_variation']) &&
        $headerOption['header_' . $header . '_breaking_variation'] == 'variation-1'
            ? 'header_' . $header . '_breaking'
            : '';

    $date =
        isset($headerOption['header_' . $header . '_breaking_variation']) &&
        $headerOption['header_' . $header . '_breaking_variation'] == 'variation-1'
            ? 'bg-white-light'
            : '';

    $text = isset($headerOption['header_' . $header . '_breaking_text'])
        ? $headerOption['header_' . $header . '_breaking_text']
        : '';

    $title_color =
        isset($headerOption['header_' . $header . '_breaking_variation']) &&
        $headerOption['header_' . $header . '_breaking_variation'] == 'variation-1'
            ? 'text-white'
            : '';

    $breaking_news = BlogHelper::getBreakingNews();
@endphp

<div class="breaking--news {{ $bg }}" id="header_breaking_{{ $header }}">
    <div class="container">
        <div class="d-lg-flex align-items-center">
            <!-- Title -->
            <div
                class="breaking-title d-flex align-items-center c1-bg text-nowrap text-white text-uppercase fw-medium px-20 py-15">
                <img class="svg mx-10" src="{{ asset('themes/newslooks/public/') }}/img/icon/flash-white.svg"
                    alt="news">
                {{ front_translate($text) }}
            </div>
            <!-- End Title -->

            <!-- News List -->
            <div class="news-updates--list overflow-hidden mx-lg-20 my-20 my-lg-0" data-marquee="true">
                <ul class="nav">
                    @foreach ($breaking_news as $news)
                        <li><a class="{{ $title_color }}"
                                href="{{ route('theme.newslooks.blog.details', $news->permalink) }}">{{ $news->name }}</a>
                        </li>
                    @endforeach
                </ul>
            </div>
            <!-- End News List -->

            <!-- Current Date -->
            <div class="current--date {{ $date }} c1-bg text-nowrap text-white px-20 py-15">
                <img class="svg mx-5" src="{{ asset('themes/newslooks/public/') }}/img/icon/clock.svg" alt="clock">
                <span class="date-now"></span>
            </div>
            <!-- End Current Date -->
        </div>
    </div>
</div>
