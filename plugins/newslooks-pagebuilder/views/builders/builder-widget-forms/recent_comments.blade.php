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
            'widget' => 'recent_comments',
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

        <!-- Blog Count -->
        <div class="form-group mb-3">
            <label for="count" class="font-14 bold black">{{ translate('Comment Count') }}</label>
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
