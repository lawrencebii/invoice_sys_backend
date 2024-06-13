<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//    guest routes
Route::middleware('guest')->group(function () {
   Route::post('/login',[\App\Http\Controllers\Auth\UserAuthenticationController::class,'login']);
   Route::post('/register', [\App\Http\Controllers\Auth\UserAuthenticationController::class, 'register']);
});
//    protected user routes
Route::middleware(['auth:sanctum'])->group(function () {


       Route::get('profile', function (Request $request) {
           return $request->user();
       });

//admin routes
        Route::middleware(['admin'])->group(function () {
            Route::get('profile-admin', function (Request $request) {
                return $request->user();
            });
        });
});



