<ul class="nav nav-tabs mb-20" id="myTab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="content-info-tab" data-toggle="tab" href="#content-info" role="tab"
            aria-controls="content-info" aria-selected="true">{{ translate('Content') }}</a>
    </li>
</ul>
<div class="tab-content" id="myTabContent">

    <!-- Content Properties -->
    <div class="tab-pane fade show active" id="content-info" role="tabpanel" aria-labelledby="content-info-tab">
        <!-- Blog Type -->
        <div class="form-group mb-3">
            <label for="header_variation" class="font-14 bold black">{{ translate('Header Variation') }}</label>
            <div class="mt-1">
                <select class="form-control select" name="header_variation" id="header_variation">
                    <option value="header-1"
                        {{ isset($widget_properties['header_variation']) && $widget_properties['header_variation'] == 'header-1' ? 'selected' : '' }}>
                        Header 1</option>
                    <option value="header-2"
                        {{ isset($widget_properties['header_variation']) && $widget_properties['header_variation'] == 'header-2' ? 'selected' : '' }}>
                        Header 2</option>
                    <option value="header-3"
                        {{ isset($widget_properties['header_variation']) && $widget_properties['header_variation'] == 'header-3' ? 'selected' : '' }}>
                        Header 3</option>
                    <option value="header-4"
                        {{ isset($widget_properties['header_variation']) && $widget_properties['header_variation'] == 'header-4' ? 'selected' : '' }}>
                        Header 4</option>
                    <option value="header-5"
                        {{ isset($widget_properties['header_variation']) && $widget_properties['header_variation'] == 'header-5' ? 'selected' : '' }}>
                        Header 5</option>
                </select>
            </div>
        </div>

        <p>You Can Set Header variation Options From Here <a href="#" class="theme-option-link" data-option="header">Header</a></p>

    </div>
</div>
