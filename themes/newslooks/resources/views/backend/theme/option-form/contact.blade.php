{{-- Blog Header --}}
<h3 class="black mb-3">{{ translate('Contact') }}</h3>
<input type="hidden" name="option_name" value="contact">

{{-- Contact Email Will Be Sent Field Start --}}
<div class="form-group row py-3 border-bottom">
    <div class="col-xl-4">
        <label for="contact_sent_email" class="font-16 bold black">{{ translate('Contact Email Will Be Sent') }}
        </label>
        <span class="d-block">{{ translate('set where will be the contact email will be sent') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="emain" name="contact_sent_email" id="contact_sent_email" class="form-control"
            value="{{ isset($option_settings['contact_sent_email']) ? $option_settings['contact_sent_email'] : '' }}"
            placeholder="{{ translate('Email') }}">
    </div>
</div>
{{-- Contact Email Will Be Sent Field End --}}
