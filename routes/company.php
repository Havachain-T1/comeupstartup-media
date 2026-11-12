<?php

use App\Http\Controllers\Company\CompanyController;
use App\Http\Controllers\Company\CompanyInvitationController;
use App\Http\Controllers\Company\CompanyMemberController;
use App\Http\Controllers\Company\CompanyVerificationController;
use Illuminate\Support\Facades\Route;

// Company portal. Uses the existing session auth; company scope is enforced by `company.member`.
Route::middleware('auth')->prefix('companies')->name('company.')->group(function () {
    Route::get('/', [CompanyController::class, 'index'])->name('index');
    Route::get('/register', [CompanyController::class, 'create'])->name('create');
    Route::post('/', [CompanyController::class, 'store'])->middleware('throttle:10,1')->name('store');

    Route::get('/invitations/{token}', [CompanyInvitationController::class, 'show'])->name('invitations.show');
    Route::post('/invitations/{token}', [CompanyInvitationController::class, 'accept'])->name('invitations.accept');

    Route::prefix('{company}')->group(function () {
        Route::get('/', [CompanyController::class, 'show'])->middleware('company.member')->name('show');
        Route::get('/profile', [CompanyController::class, 'edit'])->middleware('company.member:update_profile')->name('edit');
        Route::put('/profile', [CompanyController::class, 'update'])->middleware('company.member:update_profile')->name('update');

        Route::get('/team', [CompanyMemberController::class, 'index'])->middleware('company.member')->name('members.index');
        Route::post('/team/invitations', [CompanyMemberController::class, 'invite'])->middleware(['company.member:manage_members', 'throttle:30,1'])->name('members.invite');
        Route::delete('/team/invitations/{invitation}', [CompanyMemberController::class, 'revokeInvitation'])->middleware('company.member:manage_members')->name('members.invitations.revoke');
        Route::put('/team/{member}', [CompanyMemberController::class, 'update'])->middleware('company.member:manage_members')->name('members.update');
        Route::delete('/team/{member}', [CompanyMemberController::class, 'destroy'])->middleware('company.member')->name('members.destroy');

        Route::get('/verification', [CompanyVerificationController::class, 'create'])->middleware('company.member:manage_verification')->name('verification.create');
        Route::post('/verification', [CompanyVerificationController::class, 'store'])->middleware('company.member:manage_verification')->name('verification.store');
    });
});
