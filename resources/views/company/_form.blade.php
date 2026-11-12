<div class="cus-form-row">
    @foreach ([['name', __('Company name'), 'text', true], ['legal_name', __('Registered legal name'), 'text', false], ['registration_number', __('Registration number (e.g. RC number)'), 'text', false], ['industry', __('Industry'), 'text', false], ['website', __('Website'), 'url', false], ['email', __('Contact email'), 'email', false], ['phone', __('Phone'), 'tel', false], ['country', __('Country code (ISO, e.g. NG)'), 'text', false]] as [$field, $label, $type, $required])
        <div class="cus-field">
            <label for="{{ $field }}">{{ $label }} @if ($required)<span aria-hidden="true">*</span>@endif</label>
            <input class="cus-input" type="{{ $type }}" id="{{ $field }}" name="{{ $field }}" value="{{ old($field, $company->$field ?? '') }}" @if ($required) required @endif @error($field) aria-invalid="true" aria-describedby="{{ $field }}-error" @enderror @if ($field === 'country') maxlength="2" @endif>
            @error($field)<div class="cus-error" id="{{ $field }}-error">{{ $message }}</div>@enderror
        </div>
    @endforeach
</div>
<div class="cus-field">
    <label for="description">{{ __('About the company') }}</label>
    <textarea class="cus-input" id="description" name="description" maxlength="2000">{{ old('description', $company->description ?? '') }}</textarea>
</div>
