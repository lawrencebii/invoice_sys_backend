<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Auth\Access\Response;
use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        ResetPassword::createUrlUsing(function (object $notifiable, string $token) {
            return config('app.frontend_url')."/password-reset/$token?email={$notifiable->getEmailForPasswordReset()}";
        });
        ResetPassword::toMailUsing(function (object $notifiable) {
            $message = (new \Illuminate\Mail\Message())->view('emails.reset-password', ['user' => $notifiable]);
            return $message;
        }
        );
//        Admin Gate
        Gate::define('admin',function (){
            $user =  auth()->user();
            return  true;
            return $user->role === 'admin' ?Response::allow():(Response::deny('You must be an admin'));
        });

    }
}
