<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\CurrencyController;
use App\Http\Controllers\CustodianController;
use App\Http\Controllers\DetailsController;
use App\Http\Controllers\OverviewController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\TradesController;
use Illuminate\Support\Facades\Route;

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

Route::middleware(['guest'])->group(static function () {
    Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('login', [LoginController::class, 'login'])->name('login.attempt');
});

Route::middleware(['auth'])->group(static function () {
    Route::post('logout', [LoginController::class, 'logout'])->name('logout');
    Route::middleware('remember')->group(static function () {
        Route::get('/', [OverviewController::class, 'index'])->name('overview');
        Route::get('custodian', [CustodianController::class, 'index'])->name('custodian');
        Route::get('currency', [CurrencyController::class, 'index'])->name('currency');
        Route::get('details', [DetailsController::class, 'index'])->name('details');
        Route::get('trades', [TradesController::class, 'index'])->name('trades');
    });
    Route::get('privacy', [PagesController::class, 'privacy'])->name('page.privacy');
    Route::get('terms', [PagesController::class, 'terms'])->name('page.terms');
});
