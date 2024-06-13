<?php

namespace App\Http\Middleware;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Closure;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminMiddleware
{
    use AuthorizesRequests;
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        ;
        if (!Gate::authorize('admin')) {
            return response()->json(['message' => 'You must be an admin'], 403);
        }
        return $next($request);
    }
}
