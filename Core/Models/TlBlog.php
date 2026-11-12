<?php

namespace Core\Models;


use Core\Models\User;
use Core\Models\TlBlogTag;
use Spatie\Sitemap\Tags\Url;
use Core\Models\TlBlogComment;
use Core\Models\TlBlogTranslation;
use Illuminate\Support\Facades\App;
use Illuminate\Database\Eloquent\Model;
use Spatie\Sitemap\Contracts\Sitemapable;

class TlBlog extends Model implements Sitemapable
{
    protected $guarded = [];
 
    public function translation($field = '', $lang = false)
    {
        $lang = $lang == false ? App::getLocale() : $lang;
        $blog_translations = $this->blog_translations->where('lang', $lang)->first();
        return $blog_translations != null ? $blog_translations->$field : $this->$field;
    }

    // A Blog Has Many Translations
    public function blog_translations()
    {
        return $this->hasMany(TlBlogTranslation::class, 'blog_id');
    }

    // A Blog Belongs to One User
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // A Blog Has Many Comments
    public function comments()
    {
        return $this->hasMany(TlBlogComment::class, 'blog_id')->where('status', config('settings.blog_comment_status.approve'));
    }

    // Blog Belongs To Many Category
    public function categories()
    {
        return $this->belongsToMany(TlBlogCategory::class, 'tl_blogs_categories', 'blog_id', 'category_id');
    }

    // Blog Belongs To Many Tag
    public function tags()
    {
        return $this->belongsToMany(TlBlogTag::class, 'tl_blogs_tags', 'blog_id', 'tag_id');
    }

    // Blog Sitemap Url Create
    public function toSitemapTag(): Url | string | array
    {
        return route('theme.newslooks.blog.details', $this->permalink);
    }

    // Blog Front Translations
    public function scopeBlogFrontTranslations($query)
    {
        $query->with(['blog_translations' => function ($subQuery) {
            $subQuery->where('lang', getFrontLocale())
                ->select(['id', 'blog_id', 'name', 'short_description']);
        }]);
    }

    // Blog Front Category with Translations
    public function scopeCategoryWithTranslations($query)
    {
        $query->with(['categories' => function ($query) {
            // Load Category Translations
            $query->with(['category_translations' => function ($subQuery) {
                $subQuery->where('lang', getFrontLocale())
                    ->select(['id', 'category_id', 'name']);
            }])
                ->where('tl_blog_categories.is_publish', 1)->select(['tl_blog_categories.id', 'tl_blog_categories.name', 'tl_blog_categories.permalink']);
        }]);
    }
    
}
