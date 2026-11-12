<ul class="{{ $list }} {{ isset($column) ? $column : '' }}">
    @foreach ($main_menuTree as $menuItem)
        <li class="{{ !empty($menuItem->children) ? 'menu-item-has-children' : '' }}">

            <a href="{{ $menuItem->preview_url }}" class="{{ $text_color }}">
                {{ $menuItem->title }}
                @if (!empty($menuItem->children) && !isset($column))
                    <img class="svg mx-10" src="{{ asset('themes/newslooks/public/') }}/img/icon/angle-{{ $menuItem->level > 1 ? 'right' : 'down'  }}.svg"
                        alt="angle">
                @endif
            </a>

            @if (!empty($menuItem->children))
                @include('theme/newslooks::frontend.includes.headers.menu', [
                    'main_menuTree' => $menuItem->children,
                    'list' => 'submenu',
                    'text_color' => ''
                ])
            @endif
        </li>
    @endforeach
</ul>
