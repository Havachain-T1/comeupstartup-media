@php
    $social_options = getThemeOption('social', $active_theme->id);
    $socials = isset($social_options['social_field']) ? json_decode($social_options['social_field']) : null;

    $author_id = isset($data['author_id']) ? $data['author_id'] : null;

    $author = \Core\Models\User::with('info:*')
        ->where('id', $author_id)
        ->first();

    $author_name = isset($author->name) ? $author->name : '';
    $author_short_desc = isset($author->info->bio) ? front_translate($author->info->bio) : '';
    $socials = isset($author->info->custom_social) && $author->info->custom_social != 0 && isset($author->info->social) ? json_decode($author->info->social) : $socials;
@endphp
<!-- Widget Adout Me -->

@if (isset($data['author_title_t_']))
    <!-- Section Title -->
    <div class="section-title has-bg-shape shape--two mb-30">
        <h5 class="c1">{{ $data['author_title_t_'] }}</h5>
    </div>
    <!-- End Section Title -->
@endif

<div class="overflow-hidden radius-5">
    <!-- Image -->
    @if (isset($data['author_image']))
        <div class="author--img position-relative overflow-hidden radius-5">
            <img class="w-100 h-100 lazy" data-src="{{ asset(getFilepath($data['author_image'])) }}" alt="author">
        </div>
    @endif
    <!-- End Image -->

    <!-- Info -->
    <div class="author--info author--info-bg2 d-flex align-items-center flex-column text-center position-relative">
        <div class="section-title has-bg-shape shape--two">
            <h2 class="c1">{{ $author_name }}</h2>
        </div>

        @if (isset($data['author_designation_t_']))
            <span class="d-block">{{ $data['author_designation_t_'] }}</span>
        @endif

        <p>{{ $author_short_desc }}</p>

        <!-- Author Social Links -->
        <div class="author-social">
            @isset($socials)
                @foreach ($socials as $social)
                    @if ($social->social_icon != '')
                        <a href="{{ $social->social_icon_url }}" aria-label="social icon"><i
                                class="fa {{ $social->social_icon }} mx-1"></i></a>
                    @endif
                @endforeach
            @endisset
        </div>
    </div>
    <!-- End Info -->
</div>
