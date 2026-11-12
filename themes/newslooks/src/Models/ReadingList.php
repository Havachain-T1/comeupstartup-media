<?php

namespace Theme\NewsLooks\Models;

use Core\Models\TlBlog;
use Core\Models\User;
use Illuminate\Support\Facades\App;
use Illuminate\Database\Eloquent\Model;

class ReadingList extends Model
{
    protected $table = 'reading_list';
    protected $fillable = ['user_id', 'blog_id'];
    public $timestamps = false;

    /**
     * Belongs to user
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Belongs to Blog
     */
    public function blog()
    {
        return $this->belongsTo(TlBlog::class, 'blog_id');
    }
}
