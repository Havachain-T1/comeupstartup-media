<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Models\Company\Company;
use App\Models\Company\CompanyDocument;
use App\Services\Company\CompanyService;
use Illuminate\Http\Request;

class CompanyVerificationController extends Controller
{
    public function create(Company $company)
    {
        $verifications = $company->verifications()->with('documents')->limit(5)->get();

        return view('company.verification', ['company' => $company, 'verifications' => $verifications, 'types' => CompanyDocument::TYPES]);
    }

    public function store(Request $request, Company $company, CompanyService $companies)
    {
        $rules = ['notes' => 'nullable|string|max:2000', 'documents' => 'required|array|min:1'];
        foreach (array_keys(CompanyDocument::TYPES) as $type) {
            $rules["documents.$type"] = 'nullable|file|max:5120|mimes:pdf,jpg,jpeg,png';
        }
        $request->validate($rules, ['documents.required' => __('Upload at least one document.')]);

        $files = array_filter($request->file('documents', []));
        if (!$files) {
            return back()->withErrors(['documents' => __('Upload at least one document.')]);
        }
        $companies->submitVerification($company, $request->attributes->get('companyMember'), $files, $request->input('notes'));

        return redirect()->route('company.verification.create', $company)->with('status', __('Documents submitted for review.'));
    }
}
