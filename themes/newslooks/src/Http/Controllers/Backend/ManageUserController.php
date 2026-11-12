<?php

namespace Theme\NewsLooks\Http\Controllers\Backend;

use Core\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ManageUserController extends Controller
{
    /**
     * View All Users
     */
    public function allUsers()
    {
        $users = User::where('user_type', config('settings.user_type.user'))->paginate(10);
        return view('theme/newslooks::backend.users.index', compact('users'));

    }

    /**
     * Delete a User
     */
    public function statusUpdate(Request $request)
    {
        try {
            DB::beginTransaction();
            $user = User::find($request->user_id);
            $user->update([
                'status' => $user->status == 1 ?  2 : 1
            ]);

            DB::commit();

            return response()->json([
                'message' => translate('User Status Updated Successfully'),
                'result' => $user->status == 1 ?  'on' : 'off'
            ], 200);

        } catch (\Exception $e) {
            DB::rollback();

            return response()->json([
                'message' => translate('User Status Update Failed')
            ], 500);
        }
    }

    /**
     * Delete a User
     */
    public function deleteUser(Request $request)
    {
        try {
            DB::beginTransaction();
            $user = User::find($request->user_id);

            if ($user->image && file_exists('public/storage/users/' . $user->image)) {
                unlink('public/storage/users/' . $user->image);
            }

            $user->delete();
            DB::commit();

            toastNotification('success', translate('User Deleted Successfully'));
            return redirect()->back();

        } catch (\Exception $e) {
            DB::rollback();

            toastNotification('error', translate('User Deleting Failed'));
            return redirect()->back();
        }

    }

}
