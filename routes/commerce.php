<?php

use App\Http\Controllers\Commerce\CompanyOrderController;
use App\Http\Controllers\Commerce\PaymentReturnController;
use App\Http\Controllers\Commerce\PaymentWebhookController;
use Illuminate\Support\Facades\Route;

Route::post('/payments/webhook/{gateway}', PaymentWebhookController::class)->middleware('throttle:120,1')->name('payments.webhook');

Route::middleware('auth')->group(function () {
    Route::get('/payments/return/{reference}', [PaymentReturnController::class, 'return'])->name('payments.return');
    Route::get('/payments/sandbox/{reference}', [PaymentReturnController::class, 'sandbox'])->name('payments.sandbox.show');
    Route::post('/payments/sandbox/{reference}', [PaymentReturnController::class, 'sandboxComplete'])->name('payments.sandbox.complete');

    Route::prefix('companies/{company}/orders')->name('company.orders.')->group(function () {
        Route::get('/', [CompanyOrderController::class, 'index'])->middleware('company.member:view_billing')->name('index');
        Route::get('/{order}', [CompanyOrderController::class, 'show'])->middleware('company.member:view')->name('show');
        Route::get('/{order}/invoice', [CompanyOrderController::class, 'invoice'])->middleware('company.member:view_billing')->name('invoice');
        Route::post('/{order}/pay', [CompanyOrderController::class, 'pay'])->middleware(['company.member:manage_billing', 'throttle:20,1'])->name('pay');
    });
});
