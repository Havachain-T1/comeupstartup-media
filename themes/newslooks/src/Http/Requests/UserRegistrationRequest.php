<?php

namespace Theme\NewsLooks\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRegistrationRequest extends FormRequest
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
            'email' => 'required|email|unique:tl_users,email',
            'password' => 'required|min:6|max:18|confirmed',
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
            'name.required' => front_translate('Name Field Is Required'),
            'name.max' => front_translate('Name field maximum value is 100 characters'),
            'email.required' => front_translate('Email Field Is Required'),
            'email.email' => front_translate('Email must be a valid email'),
            'email.unique' => front_translate('An account with this email already exists'),
            'password.required' => front_translate('Password Field Is Required'),
            'password.min' => front_translate('Password minimum value is 6 characters'),
            'password.max' => front_translate('Password maximum value is 18 characters'),
            'password.confirmed' => front_translate('Confirm password does not match')
        ];
    }
}
