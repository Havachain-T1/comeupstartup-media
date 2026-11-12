<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Models\Company\Company;
use App\Models\Company\CompanyInvitation;
use App\Models\Company\CompanyMember;
use App\Services\Company\CompanyService;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    public static function rules(): array
    {
        return [
            'name' => 'required|string|max:191',
            'legal_name' => 'nullable|string|max:191',
            'registration_number' => 'nullable|string|max:100',
            'industry' => 'nullable|string|max:100',
            'website' => 'nullable|url|max:255',
            'email' => 'nullable|email|max:191',
            'phone' => 'nullable|string|max:50',
            'country' => 'nullable|alpha|size:2',
            'description' => 'nullable|string|max:2000',
        ];
    }

    public function index(Request $request)
    {
        $user = $request->user();
        $memberships = CompanyMember::with('company')->where('user_id', $user->id)
            ->whereHas('company', fn ($q) => $q->where('status', Company::STATUS_ACTIVE))->get();
        $invitations = CompanyInvitation::with('company')->where('email', strtolower($user->email))
            ->whereNull('accepted_at')->whereNull('revoked_at')->where('expires_at', '>', now())->get();

        return view('company.index', compact('memberships', 'invitations'));
    }

    public function create()
    {
        return view('company.create');
    }

    public function store(Request $request, CompanyService $companies)
    {
        $data = $request->validate(static::rules());
        $company = $companies->register($request->user(), $data);

        return redirect()->route('company.show', $company)->with('status', __('Company registered. You are its owner.'));
    }

    public function show(Request $request, Company $company)
    {
        $member = $request->attributes->get('companyMember');
        $stats = ['members' => $company->members()->count(), 'extra' => []];
        if (class_exists(\App\Models\BrandPress\PressRelease::class)) {
            $stats['extra'][__('Announcements')] = \App\Models\BrandPress\PressRelease::where('company_id', $company->id)->count();
        }

        return view('company.show', compact('company', 'member', 'stats'));
    }

    public function edit(Company $company)
    {
        return view('company.edit', compact('company'));
    }

    public function update(Request $request, Company $company)
    {
        $company->update($request->validate(static::rules()));
        activity('company')->performedOn($company)->causedBy($request->user())->log('company.profile_updated');

        return redirect()->route('company.edit', $company)->with('status', __('Company profile updated.'));
    }
}
