<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Company\Company;
use App\Models\Company\CompanyDocument;
use App\Models\Company\CompanyVerification;
use App\Services\Company\CompanyService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CompanyAdminController extends Controller
{
    public function index(Request $request)
    {
        $companies = Company::withCount('members')
            ->when($request->query('status'), fn ($q, $s) => $q->where('verification_status', $s))
            ->when($request->query('q'), fn ($q, $term) => $q->where('name', 'like', '%' . addcslashes($term, '%_\\') . '%'))
            ->latest('id')->paginate(20)->withQueryString();

        return view('admin.companies.index', compact('companies'));
    }

    public function show(Company $company)
    {
        $company->load(['members.user:id,name,email', 'verifications.documents']);

        return view('admin.companies.show', compact('company'));
    }

    public function review(Request $request, CompanyVerification $verification, CompanyService $companies)
    {
        $data = $request->validate(['decision' => 'required|in:approve,reject', 'reviewer_notes' => 'nullable|string|max:2000']);
        $companies->reviewVerification($verification, $request->user(), $data['decision'] === 'approve', $data['reviewer_notes'] ?? null);

        return redirect()->route('admin.companies.show', $verification->company)->with('success', __('Verification updated.'));
    }

    public function document(CompanyDocument $document)
    {
        return Storage::disk($document->disk)->download($document->path, $document->original_name);
    }
}
