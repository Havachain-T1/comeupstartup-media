@if ($blog->formate === 'gallery')
    <!-- Swiper -->
    <div class="swiper-container--wrap">
        <div class="swiper-container post-gallery-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="{{ getFilePath($blog->image) }}" alt="{{ $blog->name }}">
                </div>
                @foreach (explode(',', $blog->gallery_images) as $image)
                    <div class="swiper-slide">
                        <img src="{{ getFilePath($image) }}" alt="{{ $blog->name }}">
                    </div>
                @endforeach
            </div>
            <!-- Add Arrows -->
            <div class="swiper-button-next swiper-button-white btn-right"></div>
            <div class="swiper-button-prev swiper-button-white btn-left"></div>
        </div>
    </div>
@endif
@if ($blog->formate === 'standard')
    <!-- Feature Img -->
    <img data-src="{{ getFilePath($blog->image) }}" class="feature--img lazy w-100" alt="{{ $blog->name }}">
    <!-- End Feature Img -->
@endif

@if ($blog->formate === 'audio')
    @if ($blog->audio_file_type == 'sound_cloud')
        {!! $blog->audio_file !!}
    @endif
    @if ($blog->audio_file_type == 'file')
        <div class="player-section" style="background-image:url({{ getFilePath($blog->image) }})">
            @if ($blog->audio_file != null)
                <audio controls>
                    <source src="{{ getFilePath($blog->audio_file) }}" type="audio/mpeg">
                </audio>
            @endif
        </div>
    @endif
@endif

@if ($blog->formate === 'video')
    <video id="youtube-player" class="video-js vjs-default-skin vjs-big-play-centered" controls height="360"
        data-setup='{
            "fluid": true,
            "techOrder": ["youtube"],
            "sources": [{ "src": "{{ $blog->video_link }}", "type": "video/youtube" }],
            "youtube": {
               "iv_load_policy": 3,        
               "modestbranding": 1,      
               "rel": 0, 
               "showinfo": 0
            }
        }'
        poster="{{ getFilePath($blog->image) }}"></video>
@endif
