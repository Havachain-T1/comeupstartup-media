<?php

namespace App\Http\Middleware;

use App\Models\Company\Company;
use Closure;
use Illuminate\Http\Request;

/**
 * Resolves the {company} route parameter for the signed-in user only. Non-members get a 404 so
 * company existence is not disclosed. Optional ability argument: `company.member:manage_members`.
 */
class EnsureCompanyMember
{
    public function handle(Request $request, Closure $next, ?string $ability = null)
    {
        $company = $request->route('company');
        if (!$company instanceof Company) {
            $company = Company::where('slug', (string) $company)->first();
        }

        $member = $company?->membershipFor($request->user());
        if (!$member || $company->status !== Company::STATUS_ACTIVE) {
            abort(404);
        }
        if ($ability && !$member->can($ability)) {
            abort(403, 'Your company role does not allow this action.');
        }

        $request->route()->setParameter('company', $company);
        $request->attributes->set('companyMember', $member);
        app()->instance('currentCompanyMember', $member);

        return $next($request);
    }
}
