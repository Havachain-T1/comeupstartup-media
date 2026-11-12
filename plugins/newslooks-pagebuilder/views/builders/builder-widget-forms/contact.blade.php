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
            'widget' => 'contact',
        ])

        <!-- Widget Title -->
        <div class="form-group mb-3 translate-field">
            <label for="title_t_" class="mb-2 font-14 bold black">{{ translate('Widget Title') }}
            </label>
            <input type="text" name="title_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Widget Title') }}"
                value="{{ isset($widget_properties['title_t_']) ? $widget_properties['title_t_'] : '' }}">
            </label>
        </div>

        <!-- Name Placeholder -->
        <div class="form-group mb-3 translate-field">
            <label for="name_placeholder_t_" class="mb-2 font-14 bold black">{{ translate('Name Placeholder') }}
            </label>
            <input type="text" name="name_placeholder_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Name Placeholder') }}"
                value="{{ isset($widget_properties['name_placeholder_t_']) ? $widget_properties['name_placeholder_t_'] : '' }}">
            </label>
        </div>

        <!-- Email Placeholder -->
        <div class="form-group mb-3 translate-field">
            <label for="email_placeholder_t_" class="mb-2 font-14 bold black">{{ translate('Email Placeholder') }}
            </label>
            <input type="text" name="email_placeholder_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Name Placeholder') }}"
                value="{{ isset($widget_properties['email_placeholder_t_']) ? $widget_properties['email_placeholder_t_'] : '' }}">
            </label>
        </div>

        <!-- Subject Placeholder -->
        <div class="form-group mb-3 translate-field">
            <label for="subject_placeholder_t_" class="mb-2 font-14 bold black">{{ translate('Subject Placeholder') }}
            </label>
            <input type="text" name="subject_placeholder_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Subject Placeholder') }}"
                value="{{ isset($widget_properties['subject_placeholder_t_']) ? $widget_properties['subject_placeholder_t_'] : '' }}">
            </label>
        </div>

        <!-- Message Placeholder -->
        <div class="form-group mb-3 translate-field">
            <label for="message_placeholder_t_" class="mb-2 font-14 bold black">{{ translate('Message Placeholder') }}
            </label>
            <input type="text" name="message_placeholder_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Widget Title') }}"
                value="{{ isset($widget_properties['message_placeholder_t_']) ? $widget_properties['message_placeholder_t_'] : '' }}">
            </label>
        </div>

        <!-- Button Placeholder -->
        <div class="form-group mb-3 translate-field">
            <label for="button_text_t_" class="mb-2 font-14 bold black">{{ translate('Button Placeholder') }}
            </label>
            <input type="text" name="button_text_t_" id="placeholder" class="form-control mb-2"
                placeholder="{{ translate('Button Placeholder') }}"
                value="{{ isset($widget_properties['button_text_t_']) ? $widget_properties['button_text_t_'] : '' }}">
            </label>
        </div>

        <!-- Alignment -->
        <div class="form-group">
            <label for="btn_alignment"
                class="d-block mb-2 font-14 bold black">{{ translate('Submit Button Alignment') }}
            </label>
            <div class="btn-group" data-toggle="buttons">
                <label
                    class="btn btn-primary sm {{ isset($widget_properties['btn_alignment']) && $widget_properties['btn_alignment'] == 'start' ? 'active' : '' }}">
                    <input type="radio" class="d-none" name="btn_alignment" id="start" value="start"
                        @checked(isset($widget_properties['btn_alignment']) && $widget_properties['btn_alignment'] == 'start')>
                    {{ translate('Left') }}
                </label>
                <label
                    class="btn btn-primary sm {{ isset($widget_properties['btn_alignment']) && $widget_properties['btn_alignment'] == 'center' ? 'active' : '' }}">
                    <input type="radio"class="d-none" name="btn_alignment" id="center" value="center"
                        @checked(isset($widget_properties['btn_alignment']) && $widget_properties['btn_alignment'] == 'center')>
                    {{ translate('Center') }}
                </label>
                <label
                    class="btn btn-primary sm {{ isset($widget_properties['btn_alignment']) && $widget_properties['btn_alignment'] == 'end' ? 'active' : '' }}">
                    <input type="radio"class="d-none" name="btn_alignment" id="end" value="end"
                        @checked(isset($widget_properties['btn_alignment']) && $widget_properties['btn_alignment'] == 'end')>
                    {{ translate('Right') }}
                </label>
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
