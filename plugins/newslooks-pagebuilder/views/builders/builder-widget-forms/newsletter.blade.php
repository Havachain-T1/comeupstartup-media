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
        @include('plugin/newslooks-pagebuilder::page-builder.includes.lang-translate', [
            'lang' => $lang,
            'widget' => 'newsletter',
        ])

        <!-- Newsletter Title -->
        <div class="form-group mb-3 translate-field">
            <label for="title_t_" class="font-14 bold black">{{ translate('Newsletter Title') }}</label>
            <input type="text" id="title_t_" name="title_t_" class="form-control"
                placeholder="{{ translate('Newsletter Title') }}"
                value="{{ isset($widget_properties['title_t_']) ? $widget_properties['title_t_'] : '' }}">
        </div>

        <!-- Newsletter Short Desc -->
        <div class="form-group mb-3 translate-field">
            <label for="short_desc" class="font-14 bold black">{{ translate('Newsletter Short Desc') }}</label>
            <textarea id="short_desc" name="short_desc_t_" class="theme-input-style style--two"
                placeholder="{{ translate('Newsletter Short Desc') }}">{{ isset($widget_properties['short_desc_t_']) ? $widget_properties['short_desc_t_'] : '' }}</textarea>
        </div>

        <!-- Email Placeholder -->
        <div class="form-group mb-3 translate-field">
            <label for="email_placeholder" class="font-14 bold black">{{ translate('Email Placeholder') }}</label>
            <input type="text" id="email_placeholder" name="email_placeholder_t_" class="form-control"
                placeholder="{{ translate('Email Placeholder') }}"
                value="{{ isset($widget_properties['email_placeholder_t_']) ? $widget_properties['email_placeholder_t_'] : '' }}">
        </div>

        <!-- Button Text -->
        <div class="form-group mb-4 translate-field">
            <label for="btn_text" class="font-14 bold black">{{ translate('Button Text') }}</label>
            <input type="text" id="btn_text" name="btn_text_t_" class="form-control"
                placeholder="{{ translate('Button Text') }}"
                value="{{ isset($widget_properties['btn_text_t_']) ? $widget_properties['btn_text_t_'] : '' }}">
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
