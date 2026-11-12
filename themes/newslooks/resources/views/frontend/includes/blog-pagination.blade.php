<div class="pagination d-flex justify-content-{{ $pagination_alignment }} pt-30 pb-30">
    @php
        $last_page = $blogs->lastPage();
        $current_page = request()->input('page') ? request()->input('page') : 1;
    @endphp

    <ul class="list-unstyled list-inline d-inline-flex align-items-center">
        {{-- Previous Button --}}
        <li>
            <a href="{{ $route . '?page=' . request()->input('page') - 1 }}"
                style="{{ !request()->input('page') || request()->input('page') == 1 ? 'pointer-events: none' : '' }}">
                <img src="{{ asset('themes/newslooks/public/') }}/img/icon/angle-left.svg" alt="left" class="svg">
            </a>
        </li>

        @if ($pagination_type == 'number')
            {{-- CHECKING IF PAGINATION IS NUMBER OR NOT --}}
            @if (true)
                {{-- Pagination Number Start --}}
                @if ($current_page - 3 > 1)
                    <li><a href="{{ $route . '?page=' . 1 }}">1</a></li>
                    <li><a style="pointer-events: none;">...</a></li>
                @endif

                @if ($current_page - 3 == 1)
                    <li><a href="{{ $route . '?page=' . 1 }}">1</a></li>
                @endif

                @if ($current_page - 2 > 0)
                    <li><a href="{{ $route . '?page=' . $current_page - 2 }}">
                            {{ $current_page - 2 }}</a></li>
                @endif

                @if ($current_page - 1 > 0)
                    <li><a href="{{ $route . '?page=' . $current_page - 1 }}">
                            {{ $current_page - 1 }}</a></li>
                @endif

                {{-- Current Page --}}
                <li><span class="current">{{ $current_page }}</span></li>

                @if ($current_page + 1 <= $last_page)
                    <li>
                        <a href="{{ $route . '?page=' . $current_page + 1 }}">
                            {{ $current_page + 1 }}</a>
                    </li>
                @endif

                @if ($current_page + 2 == $last_page)
                    <li><a href="{{ $route . '?page=' . $last_page }}">
                            {{ $last_page }}</a>
                    </li>
                @endif

                @if ($current_page < $last_page - 2)
                    <li><a style="pointer-events: none;">...</a></li>
                    <li><a href="{{ $route . '?page=' . $last_page }}">{{ $last_page }}</a>
                    </li>
                @endif
                {{-- Pagination Number Start end --}}
            @endif
        @endif

        {{-- Next Button --}}
        @if (request()->input('page'))
            <li>
                <a href="{{ $route . '?page=' . request()->input('page') + 1 }}"
                    style="{{ request()->input('page') == $blogs->lastPage() ? 'pointer-events: none' : '' }}">
                    <img src="{{ asset('themes/newslooks/public/') }}/img/icon/angle-right.svg" alt="right"
                        class="svg">
                </a>
            </li>
        @else
            <li>
                <a href="{{ $route . '?page=2' }}"
                    style="{{ $blogs->lastPage() == 1 ? 'pointer-events: none' : '' }}">
                    <img src="{{ asset('themes/newslooks/public/') }}/img/icon/angle-right.svg" alt="right"
                        class="svg">
                </a>
            </li>
        @endif
    </ul>
</div>
