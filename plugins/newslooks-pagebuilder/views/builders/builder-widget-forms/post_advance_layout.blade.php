@php
    $blogCategories = \Core\Models\TlBlogCategory::where('is_publish', config('settings.general_status.active'))->get();
@endphp
<ul class="nav nav-tabs mb-20" id="myTab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="content-info-tab" data-toggle="tab" href="#content-info" role="tab"
            aria-controls="content-info" aria-selected="true">{{ translate('Content') }}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="background-tab" data-toggle="tab" href="#background" role="tab"
            aria-controls="background" aria-selected="false">{{ translate('Background') }}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="advanced-tab" data-toggle="tab" href="#advanced" role="tab" aria-controls="button"
            aria-selected="false">{{ translate('Advanced') }}</a>
    </li>
</ul>
<div class="tab-content" id="myTabContent">

    <!-- Content Properties -->
    <div class="tab-pane fade show active" id="content-info" role="tabpanel" aria-labelledby="content-info-tab">
        <!-- Translation -->
        @include('plugin/newslooks-pagebuilder::page-builder.includes.lang-translate', [
            'lang' => $lang,
            'widget' => 'post_advance_layout',
        ])

        <!-- Title -->
        <div class="form-group mb-3 translate-field">
            <label for="title_t_" class="mb-2 font-14 bold black">{{ translate('Widget Title') }}
            </label>
            <input type="text" name="title_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Widget Title') }}"
                value="{{ isset($widget_properties['title_t_']) ? $widget_properties['title_t_'] : '' }}">
            </label>
        </div>

        <!-- Blog Type -->
        <div class="form-group mb-3">
            <label for="type" class="font-14 bold black">{{ translate('Post Type') }}</label>
            <div class="mt-1">
                <select name="type" id="type" class="form-control">
                    <option value="recent" @selected(isset($widget_properties['type']) && $widget_properties['type'] == 'recent')>{{ translate('Recent Post') }}</option>
                    <option value="feature" @selected(isset($widget_properties['type']) && $widget_properties['type'] == 'feature')>{{ translate('Featured Post') }}</option>
                    <option value="most_comment" @selected(isset($widget_properties['type']) && $widget_properties['type'] == 'most_comment')>{{ translate('Most Commented Post') }}
                    </option>
                    <option value="most_view" @selected(isset($widget_properties['type']) && $widget_properties['type'] == 'most_view')>{{ translate('Most Viewed Post') }}</option>
                    <option value="popular" @selected(isset($widget_properties['type']) && $widget_properties['type'] == 'popular')>{{ translate('Popular Post') }}</option>
                    <option value="category" @selected(isset($widget_properties['type']) && $widget_properties['type'] == 'category')>{{ translate('Category Wise') }}</option>
                </select>
            </div>
        </div>

        <!-- Blog Category For Category Wise -->
        <div
            class="form-group mb-20 category-options {{ isset($widget_properties['type']) && $widget_properties['type'] == 'category' ? '' : 'd-none' }} ">
            <div class="col-sm-12">
                <label class="font-14 bold black">{{ translate('Select Category') }}</label>
            </div>
            <div class="col-sm-12">
                <select class="theme-input-style" name="category">
                    @foreach ($blogCategories as $category)
                        <option value="{{ $category->id }}" @selected(isset($widget_properties['category']) && $widget_properties['category'] == $category->id)>{{ $category->name }}
                        </option>
                    @endforeach
                </select>
                @if ($errors->has('category'))
                    <div class="invalid-input">{{ $errors->first('category') }}</div>
                @endif
            </div>
        </div>

        <!-- Post Colum -->
        <div class="form-group mb-3">
            <label for="type" class="font-14 bold black">{{ translate('Post Advance Style') }}</label>
            <div class="mt-1">
                <select name="post_advance_style" id="post_advance_style" class="form-control">
                    <option value="advance_layout_1" data-count="4" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_1')>Style 1</option>
                    <option value="advance_layout_2" data-count="7" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_2')>Style 2</option>
                    <option value="advance_layout_3" data-count="5" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_3')>Style 3</option>
                    <option value="advance_layout_4" data-count="5" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_4')>Style 4</option>
                    <option value="advance_layout_5" data-count="5" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_5')>Style 5</option>
                    <option value="advance_layout_6" data-count="7" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_6')>Style 6</option>
                    <option value="advance_layout_7" data-count="5" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_7')>Style 7</option>
                    <option value="advance_layout_8" data-count="6" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_8')>Style 8</option>
                    <option value="advance_layout_9" data-count="3" @selected(isset($widget_properties['post_advance_style']) && $widget_properties['post_advance_style'] == 'advance_layout_9')>Style 9</option>
                </select>
            </div>
            <div class="img-box mt-3 text-right">
                <button type="button" class="mb-1 bg-light-blue remove-img">x</button>
                <img data-src="{{ asset('themes/newslooks/public/img/blog-advance-style/') }}"
                    src="{{ asset('themes/newslooks/public/img/blog-advance-style/') }}/{{ isset($widget_properties['post_advance_style']) ? $widget_properties['post_advance_style'] . '.png' : 'advance_layout_1.png' }}"
                    alt="preview post style">
            </div>
        </div>

        <!-- Blog Count -->
        <input type="hidden" name="count" id="count"
            value="{{ isset($widget_properties['count']) ? $widget_properties['count'] : '4' }}">
    </div>

    <!-- Include background Properties -->
    @include('plugin/newslooks-pagebuilder::page-builder.properties.background-properties', [
        'properties' => $widget_properties,
    ])

    <!-- Include Advance Properties -->
    @include('plugin/newslooks-pagebuilder::page-builder.properties.advance-properties', [
        'properties' => $widget_properties,
    ])
</div>
<script>
    (function($) {
        'use strict'

        //Category Wise Select
        $(document).on('change', '#type', function() {
            let type = $(this).find("option:selected").val();
            if (type === 'category') {
                $('.category-options').removeClass('d-none');
            } else {
                $('.category-options').addClass('d-none');
            }
        });

        // Style onchange Image Update
        $(document).on('change', '#post_advance_style', function() {
            let style = $(this).find("option:selected").val();
            let post_count = $(this).find("option:selected").data('count');

            let src = $('.img-box img').data('src') + '/' + style + '.png';
            $('.img-box img').attr('src', src);
            $('.img-box').removeClass('d-none');

            $('#count').val(post_count);
        });

        // Remove Image-Box
        $(document).on('click', '.remove-img', function() {
            $('.img-box').addClass('d-none');
        })

    })(jQuery);
</script>
