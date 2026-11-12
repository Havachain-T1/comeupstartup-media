<?php

use App\Http\Controllers\AI\AiAssistController;
use Illuminate\Support\Facades\Route;

Route::post('companies/{company}/brand-press/ai-assist', [AiAssistController::class, 'brandPress'])
    ->middleware(['auth', 'company.member:create_content', 'throttle:ai'])->name('brand-press.ai-assist');

Route::middleware(['auth', 'admin.guard', 'can:Use AI Agents'])->prefix('admin/ai')->name('admin.ai.')->group(function () {
    Route::get('/agents', [AiAssistController::class, 'agents'])->name('agents');
    Route::post('/agents/{agent}', [AiAssistController::class, 'runAgent'])->middleware('throttle:ai')->name('agents.run');
});
