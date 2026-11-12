@php
    $author_id = isset($value['author_id']) ? $value['author_id'] : null;

    $author = \Core\Models\User::with('info:*')
        ->where('id', $author_id)
        ->first();

    $author_name = isset($author->name) ? $author->name : '';
    $author_short_desc = isset($author->info->bio) ? front_translate($author->info->bio) : '';
    $socials = isset($author->info->custom_social) && $author->info->custom_social != 0 && isset($author->info->social) ? json_decode($author->info->social) : $socials;
@endphp
<!-- Widget Adout Me -->
<div class="widget widget_about_me">

    @if (isset($value['widget_title']))
        <!-- Section Title -->
        <div class="section-title has-bg-shape shape--two mb-30">
            <h2 class="c1">{{ $value['widget_title'] }}</h2>
        </div>
        <!-- End Section Title -->
    @endif

    <div class="overflow-hidden radius-5">
        <!-- Image -->
        @if (isset($value['author_image']))
            <div class="author--img position-relative overflow-hidden radius-5">
                <img class="w-100 h-100 lazy" data-src="{{ asset(getFilepath($value['author_image'])) }}"
                    alt="user">
            </div>
        @endif
        <!-- End Image -->

        <!-- Info -->
        <div class="author--info author--info-bg2 d-flex align-items-center flex-column text-center position-relative">
            <div class="section-title has-bg-shape shape--two">
                <h5 class="c1">{{ $author_name }}</h5>
            </div>

            @if (isset($value['author_designation']))
                <span class="d-block">{{ $value['author_designation'] }}</span>
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
</div>
<!-- End Widget Adout Me -->
