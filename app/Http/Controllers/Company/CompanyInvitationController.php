<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Models\Company\CompanyInvitation;
use App\Services\Company\CompanyService;
use Illuminate\Http\Request;

class CompanyInvitationController extends Controller
{
    public function show(string $token)
    {
        $invitation = CompanyInvitation::findByToken($token);
        abort_unless($invitation && $invitation->isPending(), 404);

        return view('company.invitation', ['invitation' => $invitation->load('company'), 'token' => $token]);
    }

    public function accept(Request $request, string $token, CompanyService $companies)
    {
        $invitation = CompanyInvitation::findByToken($token);
        abort_unless($invitation, 404);
        $companies->accept($invitation, $request->user());

        return redirect()->route('company.show', $invitation->company)->with('status', __('Welcome to :company.', ['company' => $invitation->company->name]));
    }
}
