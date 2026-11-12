@if (!isset($data['link']) || (isset($data['link']) && $data['link'] == 'none'))
    <img data-src="{{ getFilePath($data['widget_image']) }}" alt="Image" class="lazy">
@else
    <a href="{{ $data['link'] == 'media_file' ? getFilePath($data['widget_image']) : $data['link_url'] }}"
        target="{{ $data['link'] == 'custom_url' && $data['new_window'] == '1' ? '_blank' : '_self' }}" aria-label="Image">
        <img data-src="{{ getFilePath($data['widget_image']) }}" alt="Image" class="lazy">
    </a>
@endif
