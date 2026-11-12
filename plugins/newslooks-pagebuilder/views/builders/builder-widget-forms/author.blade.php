@php
    $users = \Core\Models\User::where('status', config('settings.general_status.active'))
        ->select('id', 'name')
        ->get();
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
        <!-- Language -->
        @include('plugin/newslooks-pagebuilder::page-builder.includes.lang-translate', [
            'lang' => $lang,
            'widget' => 'author',
        ])

        <!-- Author Select -->
        <div class="form-group">
            <label for="author_id" class="font-14 bold black">{{ translate('Select a User for Authur Widget') }}</label>
            <select class="form-control mt-1" name="author_id" id="author_id">
                @foreach ($users as $user)
                    <option value="{{ $user->id }}" @selected(isset($widget_properties['author_id']) && $widget_properties['author_id'] == $user->id)>{{ $user->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <!-- Author Title -->
        <div class="form-group mb-3 translate-field">
            <label for="author_title_t_" class="font-14 bold black">{{ translate('Widget Title') }}</label>
            <input type="text" class="form-control" id="author_title_t_" name="author_title_t_"
                placeholder="{{ translate('Widget Title') }}"
                value="{{ isset($widget_properties['author_title_t_']) ? $widget_properties['author_title_t_'] : '' }}">
        </div>

        <!-- Author Designation -->
        <div class="form-group mb-3 translate-field">
            <label for="author_designation_t_" class="font-14 bold black">{{ translate('Author Designation') }}</label>
            <input type="text" class="form-control" id="author_designation_t_" name="author_designation_t_"
                placeholder="{{ translate('Author Designation') }}"
                value="{{ isset($widget_properties['author_designation_t_']) ? $widget_properties['author_designation_t_'] : '' }}">
        </div>

        <!-- Image  -->
        <div class="form-group mb-20">
            <div class="col-sm-12">
                <label class="font-14 bold black">{{ translate('Image') }} </label>
            </div>
            <div class="col-md-12">
                @include('core::base.includes.media.media_input', [
                    'input' => 'author_image',
                    'data' => isset($widget_properties['author_image'])
                        ? $widget_properties['author_image']
                        : null,
                ])
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
