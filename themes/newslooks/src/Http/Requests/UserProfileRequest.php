<?php

namespace Theme\NewsLooks\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserProfileRequest extends FormRequest
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
            'name' => 'required|max:100',
            'email' => 'required|email|unique:tl_users,email,'.$this->user->id,
            'image' => 'nullable|mimes:png,jpg,jpeg,svg|max:100|',
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
            'name.required' => translate('Name Field Is Required'),
            'name.max' => translate('Name field maximum value is 100 characters'),
            'email.required' => translate('Email Field Is Required'),
            'email.email' => translate('Email must be a valid email'),
            'email.unique' => translate('An account with this email already exists'),
            'image.mimes' => translate('The image must be a file of type: png, jpg, jpeg, svg.'),
            'image.max' => translate('The image maximum size is 100 kilobytes.')
        ];
    }
}
