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
            'widget' => 'post_filter',
        ])

        <!-- Featured Title -->
        <div class="form-group mb-3 translate-field">
            <label for="featured_t_" class="mb-2 font-14 bold black">{{ translate('Featured Title') }}
            </label>
            <input type="text" name="featured_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Featured Title') }}"
                value="{{ isset($widget_properties['featured_t_']) ? $widget_properties['featured_t_'] : '' }}">
            </label>
        </div>

        <!-- Most Popular Title -->
        <div class="form-group mb-3 translate-field">
            <label for="most_popular_t_" class="mb-2 font-14 bold black">{{ translate('Most Popular Title') }}
            </label>
            <input type="text" name="most_popular_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Most Popular Title') }}"
                value="{{ isset($widget_properties['most_popular_t_']) ? $widget_properties['most_popular_t_'] : '' }}">
            </label>
        </div>

        <!-- Most Viewed Title -->
        <div class="form-group mb-3 translate-field">
            <label for="most_viewed_t_" class="mb-2 font-14 bold black">{{ translate('Most Viewed Title') }}
            </label>
            <input type="text" name="most_viewed_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Most Viewed Title') }}"
                value="{{ isset($widget_properties['most_viewed_t_']) ? $widget_properties['most_viewed_t_'] : '' }}">
            </label>
        </div>

        <!-- Recent Title -->
        <div class="form-group mb-3 translate-field">
            <label for="recent_t_" class="mb-2 font-14 bold black">{{ translate('Recent Title') }}
            </label>
            <input type="text" name="recent_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Recent Title') }}"
                value="{{ isset($widget_properties['recent_t_']) ? $widget_properties['recent_t_'] : '' }}">
            </label>
        </div>

        <!-- Most Commented Title -->
        <div class="form-group mb-3 translate-field">
            <label for="most_commented_t_" class="mb-2 font-14 bold black">{{ translate('Most Commented Title') }}
            </label>
            <input type="text" name="most_commented_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Most Commented Title') }}"
                value="{{ isset($widget_properties['most_commented_t_']) ? $widget_properties['most_commented_t_'] : '' }}">
            </label>
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