<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
class UserAuthenticationController extends Controller
{
    //
    public  function  login(Request $request){

        $request->validate(['required'=>'email','password'=>'required']);
        $credentials = ['email'=>$request->email, 'password'=>$request->password];
        if(Auth::attempt($credentials)){

            return response(
                ['user'=>Auth::user(),
                    'token'=>Auth::user()->createToken('API Token')->plainTextToken,

                    'message'=>'Login Successful',
                    ],
                 200

            );
        }
        return response(['message'=>'login failed'],401);


    }
    public function logout(Request $request){
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return response(['message'=>'logout successfully'], 200);
    }
    public function register(Request $request){
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'address' => ['required', 'string', 'max:255'],
            'phone' => ['required', 'string', 'max:15'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required',  Rules\Password::defaults()],//'confirmed',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone'=>$request->phone,
            'address'=>$request->address,
            'password' => Hash::make($request->string('password')),
        ]);
       if($user){
           return response([
               'user'=>$user,
               'token'=>$user->createToken('API Token')->plainTextToken,
               'message'=>'register successfully',
           ], 200
           );

       }

       return response([
           'message'=>'register failed',
           'error'=>true
           ], 401);
    }
    public function userDetails(Request $request,$id)
    {
        $user = User::find($id);
        if ($user) {
            return response([
                'user' => $user,
                'message' => 'user found',
            ], 200
            );
        }
        return response([
            'message' => 'user not found',
            'error' => true
        ], 401);
    }
    public  function  newPassword(Request $request , $id){
        $request->validate([
            'password' => ['required',  Rules\Password::defaults()],
        ]);
        $user = User::find($id);
        if ($user) {
            $user->password = Hash::make($request->string('password'));
            $user->save();
            return response([
                'user' => $user,
                'message' => 'password updated successfully',
            ], 200
            );
        }
        return response([
            'message' => 'user not found',
            'error' => true
        ], 401);
    }
}
