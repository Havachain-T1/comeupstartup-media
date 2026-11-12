<!-- Widget socials -->
<ul class="nav">
    @if ($all_socials)
        @foreach ($all_socials as $social)
            @if ($social->social_icon != '')
                <li>
                    <a class="d-inline-flex align-items-center justify-content-center"
                        href="{{ $social->social_icon_url }}" aria-label="social-link">
                        <i class="fa {{ $social->social_icon }}"></i>
                    </a>
                </li>
            @endif
        @endforeach
    @endif
</ul>
<!-- Widget socials -->
