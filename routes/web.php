<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;
use App\Http\Controllers\Search\SearchSuggestController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/search-suggest', SearchSuggestController::class)
    ->middleware('throttle:search')
    ->name('search.suggest');
require __DIR__ . '/company.php';
require __DIR__ . '/commerce.php';
