@php
    $selected_ad_id = isset($widget_properties['ad_id']) ? $widget_properties['ad_id'] : null;
    $selected_ad = Core\Models\CustomAd::where('id', $selected_ad_id)->first();
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
        <div class="form-row mb-20">
            <div class="col-12">
                <label class="font-14 bold black">{{ translate('Select Ad') }} </label>
                <select name="ad_id" class="form-control page-builder-ad-selector">
                    @if ($selected_ad != null)
                        <option value="{{ $selected_ad->id }}">
                            {{ $selected_ad->title . '-' . $selected_ad->type . '-' . $selected_ad->size }}
                        </option>
                    @endif
                </select>
            </div>
            <div class="col-12 mt-3">
                <p>{{ translate('You can manage your ads from') }} <a href="{{ route('core.ads.list') }}">Ad Manager</a>
                </p>
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
