<?php

namespace Core\Models;

use Laravel\Sanctum\HasApiTokens;
use Spatie\Activitylog\LogOptions;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Notifications\DatabaseNotification;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Theme\NewsLooks\Models\ReadingList;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;
    use LogsActivity;

    protected $table = "tl_users";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'uid',
        'email',
        'image',
        'password',
        'status',
        'user_type'
    ];

    /**
     * Will return notification
     */
    public function notifications()
    {
        return $this->morphMany(DatabaseNotification::class, 'notifiable')->latest();
    }

    /**
     * Get the entity's unread notifications.
     *
     * @return \Illuminate\Database\Query\Builder
     */
    public function unreadNotifications()
    {
        return $this->notifications()->unread();
    }
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Set activity log data 
     */
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly([
                'name',
                'email',
                'image',
                'status'
            ]);
    }

    /**
     * User Info
     */
    public function info()
    {
       return $this->hasOne(UserInfo::class);
    }

    /**
     * User if Admin Or User
     */
    public function isAdmin()
    {
        return $this->user_type == null || $this->user_type == config('settings.user_type.admin') ? true : false;
    }

    /**
     * Reading List
     */
    public function readingLists()
    {
        return $this->hasMany(ReadingList::class, 'user_id');
    }

    /**
     * Check if a blog is in the reading list of a User
     */
    public function isBlogReadingList($blog_id)
    {
        $blog = $this->readingLists->where('blog_id', $blog_id)->first();
        return isset($blog);
    }
}
