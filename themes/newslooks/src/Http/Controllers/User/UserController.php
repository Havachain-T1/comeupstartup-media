<?php

namespace Theme\NewsLooks\Http\Controllers\User;

use Core\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Theme\NewsLooks\Http\Requests\UserProfileRequest;
use Theme\NewsLooks\Http\Requests\UserRegistrationRequest;
use Theme\NewsLooks\Models\ReadingList;
use Theme\NewsLooks\Repositories\BlogCommentRepository;

class UserController extends Controller
{
    /**
     * User Login Page
     */
    public function login()
    {
        if (Auth::user() && !Auth::user()->isAdmin()) {
            return redirect()->route('theme.newslooks.user.dashboard');
        } else {
            return view('theme/newslooks::user.auth.login');
        }
    }

    /**
     * User Attempt To Login
     */
    public function attemptLogin(Request $request)
    {
        $user = User::where(['email' => $request->email, 'user_type' => config('settings.user_type.user')])->first();

        if (!$user) {
            toastNotification('error', front_translate('Login Credentials Does not Match'));
            return redirect()->back();
        }

        if ($user->status == config('settings.user_status.in_active')) {
            toastNotification('error', front_translate("Your Account is not active"));
            return redirect()->route('theme.newslooks.user.login');
        }

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            if ($user->status == config('settings.user_status.in_active')) {
                toastNotification('error', front_translate("Your Account is not active"));
               return $this->logout();
            }
            
            toastNotification('success', front_translate('Login successful'));
            return redirect()->route('theme.newslooks.user.dashboard');
        }

        toastNotification('error', front_translate("Login Credentials Does not Match"));
        return redirect()->back();
    }

    /**
     * User Registration
     */
    public function registration()
    {
        return view('theme/newslooks::user.auth.register');
    }

    /**
     * User Registration Submit
     */
    public function registrationSubmit(UserRegistrationRequest $request)
    {
        try {
            $user['name'] = $request->name;
            $user['uid'] = 'USER' . Str::random('5');
            $user['email'] = $request->email;
            $user['password'] = Hash::make($request->password);
            $user['user_type'] = config('settings.user_type.user');

            DB::beginTransaction();
            User::create($user);
            DB::commit();

            toastNotification('success', front_translate('Registration Successful. Please Login'));
            return redirect()->route('theme.newslooks.user.login');
        } catch (\Exception $e) {
            DB::rollback();
            toastNotification('error', front_translate('Registration Failed'));
            return redirect()->back();
        }
    }

    /**
     * User Logout
     */
    public function logout()
    {
        Auth::logout();
        return redirect()->route('theme.newslooks.user.login');
    }

    /**
     * User Dashboard 
     */
    public function dashboard()
    {
        $readingLists = ReadingList::with('blog:id,name,permalink,image')->where('user_id', Auth::user()->id)->get()->pluck('blog');

        return view('theme/newslooks::user.back.dashboard', compact('readingLists'));
    }

    /**
     * User Comments
     */
    public function comments(Request $request)
    {
        return (new BlogCommentRepository())->getUserComments($request);
    }

    /**
     * User Profile
     */
    public function profile()
    {
        try {
            $user = Auth::user();
            return view('theme/newslooks::user.back.profile', compact('user'));
        } catch (\Exception $ex) {
            toastNotification('error', front_translate('Action failed'), 'Failed');
            return redirect()->back();
        }
    }

    /**
     * User Profile Update
     */
    public function updateProfile(UserProfileRequest $request, User $user)
    {
        try {
            DB::beginTransaction();
            $user->name = xss_clean($request['name']);
            $user->email = xss_clean($request['email']);
            $user->image = $this->updateUserImage($request, $user);
            $user->update();

            DB::commit();
            toastNotification('success', front_translate('Profile updated successfully'));
            return redirect()->route('theme.newslooks.user.profile');
        } catch (\Exception $e) {
            DB::rollBack();
            toastNotification('error', front_translate('Unable to update user profile'));
            return redirect()->route('theme.newslooks.user.profile');
        }
    }

    /**
     * Update User Password
     */
    public function updatePassword(Request $request, User $user)
    {
        $request->validate([
            'old_password' => 'required',
            'password' => 'required|min:6|max:18',
            'password_confirmation' => 'required|min:6|max:18',
        ]);

        if (!Hash::check($request['old_password'], $user->password)) {
            toastNotification('error', front_translate('Profile password updating failed'));
            return back()->withErrors([
                'old_password' => 'Incorrect password'
            ]);
        }

        if ($request->password != $request->password_confirmation) {
            toastNotification('error', front_translate('Profile password updating failed'));
            return back()->withErrors([
                'password' => 'Password Confirmation Does not Match'
            ]);
        }

        $user->password = Hash::make($request['password']);

        $user->update();

        toastNotification('success', front_translate('Profile password updated successfully'));
        return redirect()->route('theme.newslooks.user.profile');
    }

    /**
     * Upload or Remove User Image
     */
    protected function updateUserImage($request, $user)
    {
        if ($request->hasFile('image')) {
            $full_location = 'public/storage/users/';

            if (!file_exists($full_location)) {
                mkdir($full_location, 0777, true); // Creating Directory If Not Exists
            }
            $name = $user->uid . time() . '.' . $request->image->getClientOriginalExtension();

            $request->image->move($full_location, $name);

            if ($user->image && file_exists($full_location . $user->image)) {
                unlink($full_location . $user->image);
            }

            return $name;
        }
        return null;
    }

    /**
     * Remove Blog From Reading List From User Dashboard
     */
    public function removeFromReadingList(Request $request)
    {
        try {
            DB::beginTransaction();
            ReadingList::where(['user_id' => Auth::user()->id, 'blog_id' => $request->blog_id])->delete();
            DB::commit();

            toastNotification('success', front_translate('Reading List Updated Successfully'));
            return redirect()->route('theme.newslooks.user.dashboard');
        } catch (\Exception $e) {
            DB::rollBack();
            toastNotification('error', front_translate('Reading List Updating Failed'));
            return redirect()->route('theme.newslooks.user.dashboard');
        }
    }

    /**
     * Modify Reading List From Blog Details Page
     */
    public function updateReadingList(Request $request)
    {
        try {
            DB::beginTransaction();
            $readingList = ReadingList::where($request->all())->first();

            if ($readingList) {
                $readingList->delete();
                $bookmarked = false;
            } else {
                ReadingList::create($request->all());
                $bookmarked = true;
            }

            DB::commit();
            $message = $bookmarked ? front_translate('Post Added To Reading List') : front_translate('Post Removed From Reading List');

            return response()->json([
                'message' => $message,
                'bookmarked' => $bookmarked
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'message' => front_translate('Reading List Action Failed')
            ], 500);
        }
    }
}
