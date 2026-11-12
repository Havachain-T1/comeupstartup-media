<?php

use App\Http\Controllers\BrandPress\BrandPressAdminController;
use App\Http\Controllers\BrandPress\BrandPressController;
use Illuminate\Support\Facades\Route;

Route::middleware('auth')->prefix('companies/{company}/brand-press')->name('brand-press.')->group(function () {
    Route::get('/', [BrandPressController::class, 'index'])->middleware('company.member')->name('index');
    Route::get('/new', [BrandPressController::class, 'create'])->middleware('company.member:create_content')->name('create');
    Route::post('/', [BrandPressController::class, 'store'])->middleware('company.member:create_content')->name('store');
    Route::get('/{release}', [BrandPressController::class, 'show'])->middleware('company.member')->name('show');
    Route::get('/{release}/edit', [BrandPressController::class, 'edit'])->middleware('company.member:create_content')->name('edit');
    Route::put('/{release}', [BrandPressController::class, 'update'])->middleware('company.member:create_content')->name('update');
    Route::post('/{release}/submit', [BrandPressController::class, 'submit'])->middleware('company.member:submit_content')->name('submit');
});

Route::middleware(['auth', 'admin.guard', 'can:Manage Brand Press'])->prefix('admin/brand-press')->name('admin.brand-press.')->group(function () {
    Route::get('/', [BrandPressAdminController::class, 'index'])->name('index');
    Route::get('/{release}', [BrandPressAdminController::class, 'show'])->name('show');
    Route::post('/{release}/action', [BrandPressAdminController::class, 'action'])->name('action');
});
