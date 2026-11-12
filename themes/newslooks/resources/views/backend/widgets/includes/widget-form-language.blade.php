<div class="row mb-3">
    <div class="col-12">
        <ul class="nav nav-tabs nav-fill border-light border-0">
            @php
                $languages = getAllLanguages();
            @endphp
            @foreach ($languages as $key => $language)
                <li class="nav-item">
                    <a class="nav-link @if ($language->code == $lang) active border-0 @else bg-light @endif py-2"
                        href="javascript:void(0)"
                        onclick="getSidebarWidgetTranslationField(this,{{ $sidebar_has_widget_id }},{{ $widget_id }},'{{ $language->code }}')">
                        <img src="{{ asset('/public/flags/') . '/' . $language->code . '.png' }}" width="20px"
                            title="{{ $language->name }}">
                    </a>
                </li>
            @endforeach
        </ul>
    </div>
</div>
<input type="hidden" name="lang" value="{{ $lang }}">
