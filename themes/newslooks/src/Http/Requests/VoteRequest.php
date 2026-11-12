<?php

namespace Theme\NewsLooks\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VoteRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        return [
            'title' => 'required',
            'date' => 'required',
            'options' => 'required',
        ];
    }

    /**
     * Custom message
     * 
     * @return array
     */
    public function messages()
    {
        return [
            'title.required' => translate('Title Field Is Required'),
            'date.required' => translate('Date Field Is Required'),
            'options.required' => translate('Option Field Is Required')
        ];
    }
}
