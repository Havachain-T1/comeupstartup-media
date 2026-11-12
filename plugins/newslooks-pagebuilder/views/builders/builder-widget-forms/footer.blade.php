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
            <label for="footer_variation" class="font-14 bold black">{{ translate('Footer Variation') }}</label>
            <div class="mt-1">
                <select class="form-control select" name="footer_variation" id="footer_variation">
                    <option value="footer-1"
                        {{ isset($widget_properties['footer_variation']) && $widget_properties['footer_variation'] == 'footer-1' ? 'selected' : '' }}>
                        Footer 1</option>
                    <option value="footer-2"
                        {{ isset($widget_properties['footer_variation']) && $widget_properties['footer_variation'] == 'footer-2' ? 'selected' : '' }}>
                        Footer 2</option>
                </select>
            </div>
        </div>

        <p>You Can Set Footer variation Options From Here <a href="#" class="theme-option-link" data-option="footer">Footer</a></p>

    </div>
</div>
