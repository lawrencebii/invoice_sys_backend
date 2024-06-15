<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\Auth\UserAuthenticationController;
use \App\Http\Controllers\AdminController ;
use \App\Http\Controllers\InvoiceController ;

//    guest routes
Route::middleware('guest')->group(function () {
   Route::post('/login',[UserAuthenticationController::class,'login']);
   Route::post('/register', [UserAuthenticationController::class, 'register']);
});
//    protected user routes
Route::middleware(['auth:sanctum'])->group(function () {


       Route::get('profile', function (Request $request) {
           return $request->user();
       });
       Route::patch(
           'update/{id}',[UserAuthenticationController::class,"updateUser"]
       );
       Route::post('new-password', [UserAuthenticationController::class, 'newPassword']);
    Route::post('logout', [UserAuthenticationController::class, 'logout']);

    Route::get('user/{id}', [UserAuthenticationController::class, 'userDetails']);
    Route::get('user/{id}/invoices', [InvoiceController::class, 'allUserInvoices']);
//admin
        Route::middleware(['admin'])->group(function () {
            Route::get('profile-admin', function (Request $request) {
                return $request->user();
            });
            Route::get('all-users', [AdminController::class, 'allUsers']);

            Route::delete('delete-user/{id}',[AdminController::class, 'deleteUser']);
            Route::patch('appoint-admin/{id}',[AdminController::class, 'appointUserAsAdmin']);
            Route::patch('demote-amin/{id}',[AdminController::class, 'removeAdminRole']);
//            invoices
            Route::get('invoices', [InvoiceController::class, 'allInvoices']);
            Route::get('invoice/{id}', [InvoiceController::class, 'invoiceDetails']);
            Route::post('create-invoice', [InvoiceController::class, 'createInvoice']);
            Route::patch('update-invoice/{id}', [InvoiceController::class, 'updateInvoice']);

        });
});



