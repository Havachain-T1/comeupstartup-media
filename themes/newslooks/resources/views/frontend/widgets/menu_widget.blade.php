@php
    $menu_group_id = isset($value['menu_group_id']) ? $value['menu_group_id'] : null;
    $menu_structure = getMenuStructureByGroupId($menu_group_id);
    $top_menuTree = buildMenuTree($menu_structure);
@endphp

<!-- About Widget -->
<div class="widget widget_menu">
    @isset($value['widget_title'])
        <!-- Section Title -->
        <div class="section-title has-bg-shape shape--two mb-30">
            <h2 class="c1">{{ $value['widget_title'] }}</h2>
        </div>
        <!-- End Section Title -->
    @endisset

    <ul>
        @foreach ($top_menuTree as $item)
            <li class="mb-1">
                <a href="{{ $item->preview_url }}">{{ $item->title }}</a>
            </li>
        @endforeach
    </ul>
</div>
<!-- End About Widget -->
