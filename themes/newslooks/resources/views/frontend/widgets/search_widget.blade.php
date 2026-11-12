@php
    $placeholder = isset($value['search_placeholder']) ? $value['search_placeholder'] : front_translate('Search Keyword');
@endphp
<!-- Widget Search -->
<div class="widget widget_search">
    <form action="#" class="header-search-form">
        <div class="theme-input-group">
            <input type="text" name="search" class="search-text" placeholder="{{ $placeholder }}…">
            <button type="button" class="search-btn" aria-label="search button">
                <img class="svg" src="{{ asset('themes/newslooks/public/') }}/img/icon/search.svg" alt="search">
            </button>
        </div>
    </form>
</div>
<!-- Widget Search End -->