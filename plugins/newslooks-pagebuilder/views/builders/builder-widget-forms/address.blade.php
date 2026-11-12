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
            'widget' => 'address',
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

        <!-- Description -->
        <div class="form-group mb-3 translate-field">
            <label for="description_t_" class="mb-2 font-14 bold black">{{ translate('Description') }}
            </label>
            <textarea name="description_t_" id="description_t_" class="theme-input-style style--two"
                placeholder="{{ translate('Description') }}">{{ isset($widget_properties['description_t_']) ? $widget_properties['description_t_'] : '' }}</textarea>
            </label>
        </div>

        <!-- Address -->
        <div class="form-group mb-3 translate-field">
            <label for="address_t_" class="mb-2 font-14 bold black">{{ translate('Address') }}
            </label>
            <textarea name="address_t_" id="address_t_" class="theme-input-style style--two"
                placeholder="{{ translate('Address') }}">{{ isset($widget_properties['address_t_']) ? $widget_properties['address_t_'] : '' }}</textarea>
        </div>

        <!-- Mail -->
        <div class="form-group mb-3">
            <label for="mail" class="mb-2 font-14 bold black">{{ translate('Mail') }}
            </label>
            <input type="mail" name="mail" id="mail" class="form-control mb-2"
                placeholder="{{ translate('Mail') }}"
                value="{{ isset($widget_properties['mail']) ? $widget_properties['mail'] : '' }}">
            </label>
        </div>

        <!-- Phone -->
        <div class="form-group">
            <label for="phone" class="mb-2 font-14 bold black">{{ translate('Phone') }}
            </label>
            <input type="text" name="phone" id="phone" class="form-control mb-2"
                placeholder="{{ translate('Phone') }}"
                value="{{ isset($widget_properties['phone']) ? $widget_properties['phone'] : '' }}">
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

    })(jQuery);
</script>
