@php
    $ad_details = Core\Models\CustomAd::where('id', $value)->first();
@endphp
<form action="#" class=" widget_input_field_form px-3 py-3 bg-white"
    onsubmit="event.preventDefault(); widgetInputFormSubmit(this);">

    <div class="form-row mb-20">
        <div class="col-12">
            <label class="font-14 bold black">{{ translate('Select Ad') }} </label>
            <select name="ad_id" class="form-control page-builder-ad-selector">
                @if ($ad_details != null)
                    <option value="{{ $ad_details->title }}" selected>
                        {{ $ad_details->title . '-' . $ad_details->type . '-' . $ad_details->size }}
                    </option>
                @endif
            </select>
        </div>
        <div class="col-12 mt-3">
            <p>{{ translate('You can manage your ads from') }} <a href="{{ route('core.ads.list') }}">Ad Manager</a>
            </p>
        </div>
    </div>
    @include('theme/newslooks::backend.widgets.includes.widget-form-footer')

</form>
