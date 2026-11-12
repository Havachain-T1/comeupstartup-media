<?php
namespace Core\Repositories;

use Core\Models\User;
use Illuminate\Support\Facades\DB;

class UserRepository{

    /**
     * Get Admin Users
     */
    public function getUserProfileInfo($data,$match_case=[])
    {
        $data = User::with('info:*')
        ->leftJoin('tl_uploaded_files','tl_uploaded_files.id','=','tl_users.image')
        ->where('tl_users.user_type', '=', config('settings.user_type.admin'))
        ->where($match_case)
        ->select($data);
        return $data;
    }

}