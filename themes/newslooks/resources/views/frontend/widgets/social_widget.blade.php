<!-- Widget Social Media -->
<div class="widget widget_social_media_info">

    @if (isset($value['widget_title']))
        <!-- Section Title -->
        <div class="section-title has-bg-shape shape--two mb-30">
            <h2 class="c1">{{ $value['widget_title'] }}</h2>
        </div>
        <!-- End Section Title -->
    @endif

    <ul class="nav">
        @foreach ($all_socials as $social)
            <li class="col-6 media align-items-center text-white" style="background-color: {{ $social->social_icon_color }};">
                <div class="social_icon">
                    <i class="fa {{ $social->social_icon }}"></i>
                </div>
                <div class="media-body">
                    <h5 class="text-white">{{ $social->social_icon_top }}</h5>
                    <span>{{ $social->social_icon_bottom }}</span>
                </div>
                <a class="social_links position-absolute fixed-top w-100 h-100" href="{{ $social->social_icon_url }}"  aria-label="social-link"></a>
            </li>
        @endforeach
    </ul>
</div>
<!-- End Widget Social Media -->
