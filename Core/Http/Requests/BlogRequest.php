<?php

namespace Core\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class BlogRequest extends FormRequest
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
        $rules = [];
        if ($this->input('id')) {
            $rules['name'] = 'required|max:225|unique:tl_blogs,name,' . $this->input('id');
            $rules['permalink'] = 'required|unique:tl_blogs,permalink,' . $this->input('id');
        } else {
            $rules['name'] = 'required|max:225|unique:tl_blogs,name';
            $rules['permalink'] = 'required|unique:tl_blogs,permalink';
        }

        $rules['categories'] = 'array';
        $rules['blog_image'] = 'nullable|exists:tl_uploaded_files,id';
        $rules['content']  = 'nullable';
        $rules['meta_title'] = 'nullable';
        $rules['meta_description'] = 'nullable';
        $rules['meta_image'] = 'nullable|exists:tl_uploaded_files,id';
        $rules['visibility'] = ['required', Rule::in(config('settings.visibility_status'))];

        return $rules;
    }


    /**
     * Custom message
     * 
     * @return array
     */
    public function messages()
    {
        return  [
            'name.required' =>  translate('Please Insert Post Name'),
            'name.unique' => translate('This Name is Already Available Please Insert Another'),
            'name.max' => translate('Please Write The Post Name under 225 words'),
            'permalink.unique' => translate('This Permalink is Already Available Please Insert Another'),
            'categories.array' => translate('Something went Wrong, Please Select Category Again'),
            'blog_image.exists' => translate('Please Insert A Valid Image'),
            'content.required' => translate('Please write some Content'),
            'meta_image.exists' => translate('Please Select a Valid Image'),
            'visibility.*' => translate('Something went Wrong, Please Select Visibility Again')
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException($this->redirector->to($this->getRedirectUrl())
            ->withErrors($validator->getMessageBag())
            ->withInput()
            ->with('form-error', translate('Please check for missing field or invalid data and try again.')));
    }
}
