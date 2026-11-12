<?php

namespace Core\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LanguageRequest extends FormRequest
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
     * @return array<string, mixed>
     */
    public function rules()
    {
        if($this->input('id')) {
            return [
                'name' => 'required',
                'code' => 'required|unique:tl_languages,code,'.$this->input('id')
            ];
        } else {
            return [
                'name' => 'required',
                'code' => 'required|unique:tl_languages,code'
            ];
        }
    }
    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'name.required' => translate('Name is required'),
            'code.required' => translate('Code is required'),
            'code.unique' => translate('Code already exist in another language'),
        ];
    }
}
