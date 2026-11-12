@php
    $number_of_blogs = isset($value) && isset($value['number_of_blogs']) ? $value['number_of_blogs'] : '';
@endphp

<form action="#" class="widget_input_field_form px-3 py-3 bg-white"
    onsubmit="event.preventDefault(); widgetInputFormSubmit(this);">

    <p class="black">{{ translate('Recent Tab, Popular tab and Most Comment Tab') }}</p>
    
    <div class="form-group">
        <label for="number_of_blogs">{{ translate('Number of Posts') }}</label>
        <input type="number" min="1" step="1" required class="form-control" id="number_of_blogs" name="number_of_blogs"
            placeholder="{{ translate('Number of Posts') }}" value="{{ $number_of_blogs }}" >
    </div>

    <div class="px-3 row justify-content-between">
        <div>
            <a href="javascript:;void(0)" class="text-danger"
                onclick="removeFromSidebar(this)">{{ translate('Delete') }}</a>
            <span class="mx-1">|</span>
            <a href="javascript:;void(0)" class="text-info"
                onclick="closeSidebarDropMenu(this)">{{ translate('Done') }}</a>
        </div>
        <button type="submit" class="btn btn-primary sm">{{ translate('Save') }}</button>
    </div>
</form>
