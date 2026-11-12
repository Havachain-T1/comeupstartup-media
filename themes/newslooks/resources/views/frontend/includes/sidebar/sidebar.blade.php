@php
    $sidebar_id = getThemeSidebarId($sidebar);
    $all_sidebar_widgets = getAllSidebarWidgetValuesFrontend($sidebar_id);
@endphp

<div class="aside aside-sticky mb-30">
    @foreach ($all_sidebar_widgets as $widget)
        @php
            $name = strtolower(str_replace(' ', '_', $widget['widget_name']));
        @endphp

        @includeIf('theme/newslooks::frontend.widgets.' . $name, [
            'value' => $widget['widget_value'],
        ])
    @endforeach
</div>
