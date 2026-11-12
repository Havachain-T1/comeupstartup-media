@if (isset($data['ad_id']))
    @php
        $selected_ad = Core\Models\CustomAd::find($data['ad_id']);
    @endphp
    @if ($selected_ad != null && $selected_ad->isActive())
        @php
            $size_array = explode('x', $selected_ad->size);
            $width = $size_array[0];
            $height = $size_array[1];
        @endphp
        @if ($selected_ad->type == 'iframe')
            <iframe src="{{ $selected_ad->content }}"
                style="width:{{ $width }}px; height:{{ $height }}px; border: none;" frameborder="0"
                class="ads-sense-ad ad-clicker" data-id="{{ $selected_ad->id }}" allowfullscreen>
            </iframe>
        @endif
        @if ($selected_ad->type == 'image')
            <a href="{{ $selected_ad->url }}" class="ads-sense-ad ad-clicker" data-id="{{ $selected_ad->id }}"
                target="_blank">
                <img data-src="{{ getFilePath($selected_ad->content) }}" alt="Ads" class="img-fluid lazy">
            </a>
        @endif

        @if ($selected_ad->type == 'adsense')
            <div class="ads-sense-ad ad-clicker" data-id="{{ $selected_ad->id }}">
                {!! $selected_ad->content !!}
            </div>
        @endif
    @endif
@else
    @php
        $option_settings = getThemeOption('google_adsense', $active_theme->id);
        $adsense_list = null;
        if (isset($option_settings['adsense_list']) && $option_settings['adsense_list'] != '') {
            $adsense_list = json_decode($option_settings['adsense_list'], true);
        }
        $ads_url = isset($data['ads_url']) ? $data['ads_url'] : '/';
        $ads_image = isset($data['ads_image']) ? $data['ads_image'] : '';
        $target = isset($data['new_window']) && $data['new_window'] == 1 ? '_blank' : '_self';
    @endphp
    @if (isset($data['google_adsense']) &&
            !empty($data['google_adsense']) &&
            isset($adsense_list) &&
            findAdsense($data['google_adsense'], $adsense_list))
        {!! findAdsense($data['google_adsense'], $adsense_list) !!}
    @else
        <a href="{{ $ads_url }}" aria-label="ads" target="{{ $target }}">
            <img data-src="{{ getFilePath($ads_image) }}" alt="Ads" class="img-fluid lazy">
        </a>
    @endif
@endif
