@php
    $fonts = getAllFonts();
@endphp
{{-- Page Header --}}
<h3 class="black mb-3">{{ translate('Page') }}</h3>
<input type="hidden" name="option_name" value="page">

{{-- Breadcrumb Breadcrumb --}}
@include('theme/newslooks::backend.theme.components.switch', [
    'text' => translate('Page Breadcrumb'),
    'switch_name' => 'page_breadcrumb',
])