{{-- Theme Option Navbar --}}
@canany(['Manage Theme General settings', 'Manage Widget'])
    <li
        class="{{ Request::routeIs(['theme.newslooks.options', 'theme.newslooks.widgets']) ? 'active sub-menu-opened' : '' }}">
        <a href="#">
            <i class="icofont-ui-theme"></i>
            <span class="link-title">{{ translate('Theme Options') }}</span>
        </a>
        <ul class="nav sub-menu">
            @can('Manage Theme General settings')
                <li class="{{ Request::routeIs(['theme.newslooks.options']) ? 'active ' : '' }}">
                    <a href="{{ route('theme.newslooks.options') }}">{{ translate('General Settings') }}</a>
                </li>
            @endcan

            @can('Manage Widget')
                <li class="{{ Request::routeIs('theme.newslooks.widgets') ? 'active ' : '' }}">
                    <a href="{{ route('theme.newslooks.widgets') }}">{{ translate('Widgets') }}</a>
                </li>
            @endcan
        </ul>
    </li>
@endcanany

{{-- Manage Members --}}
@canany(['Manage Members'])
<li class="{{ Request::routeIs('theme.newslooks.users') ? 'active ' : '' }}">
    <a href="{{ route('theme.newslooks.users') }}">
        <i class="icofont-user-alt-4"></i>
        <span class="link-title">{{ translate('Manage Members') }}</span>
    </a>
</li>
@endcanany

{{-- Votting --}}
@canany(['Manage Voting'])
    <li class="{{ Request::routeIs('theme.newslooks.vote.index') ? 'active ' : '' }}">
        <a href="{{ route('theme.newslooks.vote.index') }}">
            <i class="icofont-chart-bar-graph"></i>
            <span class="link-title">{{ translate('Manage Voting') }}</span>
        </a>
    </li>
@endcanany
