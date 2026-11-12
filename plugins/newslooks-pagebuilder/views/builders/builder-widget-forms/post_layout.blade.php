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
            'widget' => 'post_layout',
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
                    <option value="most_comment" @selected(isset($widget_properties['type']) && $widget_properties['type'] == 'most_comment')>{{ translate('Most Commented Post') }}</option>
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
            <label for="type" class="font-14 bold black">{{ translate('Post Style') }}</label>
            <div class="mt-1">
                <select name="post_style" id="post_style" class="form-control">
                    <option value="s_one" @selected(isset($widget_properties['post_style']) && $widget_properties['post_style'] == 's_one')>Style 1</option>
                    <option value="s_two" @selected(isset($widget_properties['post_style']) && $widget_properties['post_style'] == 's_two')>Style 2</option>
                    <option value="s_three" @selected(isset($widget_properties['post_style']) && $widget_properties['post_style'] == 's_three')>Style 3</option>
                    <option value="s_four" @selected(isset($widget_properties['post_style']) && $widget_properties['post_style'] == 's_four')>Style 4</option>
                    <option value="s_five" @selected(isset($widget_properties['post_style']) && $widget_properties['post_style'] == 's_five')>Style 5</option>
                </select>
            </div>
            <div class="img-box mt-3 text-right">
                <button type="button" class="mb-1 bg-light-blue remove-img">x</button>
                <img data-src="{{ asset('themes/newslooks/public/img/blog-style/') }}" src="{{ asset('themes/newslooks/public/img/blog-style/').'/'. (isset($widget_properties['post_style']) ? $widget_properties['post_style'].'.png' : 's_one.png') }}" alt="preview post style">
            </div>
        </div>

        <!-- Post Column -->
        <div class="form-group mb-3">
            <label for="slide_item" class="col-5 mb-2 font-14 bold black p-0">{{ translate('Post Column') }}</label>
            <div class="row">
                <div class="col-sm-4">
                    <select name="post_column_lg" id="post_column_lg" class="form-control">
                        <option value="col-lg-12" @selected(isset($widget_properties['post_column_lg']) && $widget_properties['post_column_lg'] == 'col-lg-12')>1 Column</option>
                        <option value="col-lg-6" @selected(isset($widget_properties['post_column_lg']) && $widget_properties['post_column_lg'] == 'col-lg-6')>2 Column</option>
                        <option value="col-lg-4" @selected(isset($widget_properties['post_column_lg']) && $widget_properties['post_column_lg'] == 'col-lg-4')>3 Column</option>
                        <option value="col-lg-3" @selected(isset($widget_properties['post_column_lg']) && $widget_properties['post_column_lg'] == 'col-lg-3')>4 Column</option>
                    </select>
                    <small class="bold ml-2">{{ translate('Desktop') }}</small>
                </div>

                <div class="col-sm-4">
                    <select name="post_column_md" id="post_column_md" class="form-control">
                        <option value="col-sm-12" @selected(isset($widget_properties['post_column_md']) && $widget_properties['post_column_md'] == 'col-sm-12')>1 Column</option>
                        <option value="col-sm-6" @selected(isset($widget_properties['post_column_md']) && $widget_properties['post_column_md'] == 'col-sm-6')>2 Column</option>
                        <option value="col-sm-4" @selected(isset($widget_properties['post_column_md']) && $widget_properties['post_column_md'] == 'col-sm-4')>3 Column</option>
                        <option value="col-sm-3" @selected(isset($widget_properties['post_column_md']) && $widget_properties['post_column_md'] == 'col-sm-3')>4 Column</option>
                    </select>
                    <small class="bold ml-2">{{ translate('Tab') }}</small>
                </div>

                <div class="col-sm-4">
                    <select name="post_column_sm" id="post_column_sm" class="form-control">
                        <option value="col-12" @selected(isset($widget_properties['post_column_sm']) && $widget_properties['post_column_sm'] == 'col-12')>1 Column</option>
                        <option value="col-6" @selected(isset($widget_properties['post_column_sm']) && $widget_properties['post_column_sm'] == 'col-6')>2 Column</option>
                        <option value="col-4" @selected(isset($widget_properties['post_column_sm']) && $widget_properties['post_column_sm'] == 'col-4')>3 Column</option>
                        <option value="col-3" @selected(isset($widget_properties['post_column_sm']) && $widget_properties['post_column_sm'] == 'col-3')>4 Column</option>
                    </select>
                    <small class="bold ml-2">{{ translate('Mobile') }}</small>
                </div>
            </div>
        </div>

        <!-- Blog Count -->
        <div class="form-group mb-3">
            <label for="count" class="font-14 bold black">{{ translate('Post Count') }}</label>
            <div class="mt-1">
                <input type="number" min="1" step="1" required name="count" id="count"
                    class="form-control" placeholder="{{ translate('Post Count') }}"
                    value="{{ isset($widget_properties['count']) ? $widget_properties['count'] : '' }}">
            </div>
        </div>
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
        $(document).on('change', '#post_style', function() {
            let style = $(this).find("option:selected").val();
            let src = $('.img-box img').data('src') + '/' + style + '.png';
            $('.img-box img').attr('src', src);
            $('.img-box').removeClass('d-none');
        });

        // Remove Image-Box
        $(document).on('click', '.remove-img', function() {
            $('.img-box').addClass('d-none');
        })

    })(jQuery);
</script>
