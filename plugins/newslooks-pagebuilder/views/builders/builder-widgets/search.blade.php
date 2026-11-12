@php
    $placeholder = isset($data['placeholder_t_']) ? $data['placeholder_t_'] : front_translate('Search Keyword');
@endphp

<!-- Widget Search -->
<form action="#" class="header-search-form">
    <div class="theme-input-group">
        <input type="text" name="search" class="search-text" placeholder="{{ $placeholder }}…">
        <button type="button" class="search-btn" aria-label="search button">
            <img class="svg" src="{{ asset('themes/newslooks/public/') }}/img/icon/search.svg" alt="">
        </button>
    </div>
</form>
<!-- Widget Search End -->
