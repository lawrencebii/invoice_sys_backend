<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class AdminController extends Controller
{
    //
    public function allUsers(Request $request){
        if(Gate::allows('admin'))
        $users = User::all();
        return response(['users'=>$users]);
    }
    public function deleteUser(Request $request,string $id){
        if (!Gate::allows('super-admin')) {
            return response(['message' => 'You are not authorized to delete users'], 401);
        }
        $user = User::find($id);
        $user->softDelete();
        return response(['message'=>'User deleted successfully']);
    }
    public  function  appointUserAsAdmin(Request $request)
    {
        if(!Gate::allows('super-admin')){
            return response(['message'=>'You are not authorized to appoint user as admin'], 401);
        }
        $user = User::find($request->id);
        $user->role = 'admin';
        $user->save();
        return response(['message' => 'User promoted to admin successfully']);
    }
    public function removeAdminRole(Request $request)
    {
        if(!Gate::allows('super-admin')){
            return response(['message'=>'You are not authorized to remove admin role'],401);
        }
//        only super admin can remove admin role
        $user = User::find($request->id);
        $user->role = 'user';
        $user->save();
        return response(['message' => 'Admin role removed successfully']);
    }

}
