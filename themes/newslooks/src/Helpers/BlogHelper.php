<?php

namespace Theme\NewsLooks\Helpers;

use Core\Models\TlBlog;
use Core\Models\TlBlogTag;
use Core\Models\TlBlogComment;
use Core\Models\TlBlogCategory;
use Theme\NewsLooks\Models\Vote;

class BlogHelper
{

    /**
     * Filter Blogs
     */
    public static function filterBlogs($type, $count, $category = null)
    {
        $blogs = collect();
        switch ($type) {
            case 'recent':
                $blogs = self::getRecentBlogs($count);
                break;

            case 'feature':
                $blogs = self::getFeatureBlogs($count);
                break;

            case 'popular':
                $blogs = self::getPopularBlogs($count);
                break;

            case 'most_view':
                $blogs = self::getMostViewBlogs($count);
                break;

            case 'most_comment':
                $blogs = self::getMostCommentBlogs($count);
                break;

            case 'category':
                $blogs = self::getCategoryBlogs($category, $count);
                break;
        }

        return $blogs;
    }

    /**
     * Recent Blogs
     */
    public static function getRecentBlogs($limit)
    {

        $recentBlogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->with('user:id,name,image')
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ])
            ->select(['id', 'user_id', 'name', 'permalink', 'short_description', 'image', 'publish_at', 'views', 'formate'])
            ->orderBy('publish_at', 'desc')
            ->take($limit)
            ->get();

        return self::blogTranslate($recentBlogs);
    }

    /**
     * Featured Blogs
     */
    public static function getFeatureBlogs($limit)
    {
        $featureBlogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->with('user:id,name,image')
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')],
                ['is_featured', '=',  config('settings.general_status.active')]
            ])
            ->select(['id', 'user_id', 'name', 'permalink', 'short_description', 'image', 'publish_at', 'views', 'formate'])
            ->orderBy('publish_at', 'desc')
            ->take($limit)
            ->get();

        return self::blogTranslate($featureBlogs);
    }

    /**
     * Get Popular Blog
     */
    public static function getPopularBlogs($limit)
    {
        $popularBlogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->with('user:id,name,image')
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ])
            ->select(['id', 'user_id', 'name', 'permalink', 'short_description', 'image', 'publish_at', 'views', 'formate'])
            ->withCount('comments')
            ->orderBy('comments_count', 'desc')
            ->orderBy('views', 'desc')
            ->take($limit)
            ->get();

        return self::blogTranslate($popularBlogs);
    }

    /**
     * Get Most Viewed Blog
     */
    public static function getMostViewBlogs($limit)
    {
        $mostViewBlogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->with('user:id,name,image')
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ])
            ->select(['id', 'user_id', 'name', 'permalink', 'short_description', 'image', 'publish_at', 'views', 'formate'])
            ->orderBy('views', 'desc')
            ->take($limit)
            ->get();

        return self::blogTranslate($mostViewBlogs);
    }

    /**
     * Get Most Commented Blog
     */
    public static function getMostCommentBlogs($limit)
    {
        $mostCommentBlogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->with('user:id,name,image')
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ])
            ->select(['id', 'user_id', 'name', 'permalink', 'short_description', 'image', 'publish_at', 'views', 'formate'])
            ->withCount('comments')
            ->orderBy('comments_count', 'desc')
            ->take($limit)
            ->get();

        return self::blogTranslate($mostCommentBlogs);
    }

    /**
     * Get Category Wise Blog
     */
    public static function getCategoryBlogs($category, $limit)
    {
        $categoryBlogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->with('user:id,name,image')
            ->whereHas('categories', function ($query) use ($category) {
                $query->where('tl_blog_categories.id', $category);
            })
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ])
            ->select(['id', 'user_id', 'name', 'permalink', 'short_description', 'image', 'publish_at', 'views', 'formate'])
            ->orderBy('created_at', 'desc')
            ->take($limit)
            ->get();

        return self::blogTranslate($categoryBlogs);
    }

    /**
     * Related Blogs
     */
    public static function getRelatedBlogs($blog)
    {
        $categories = $blog->categories()->get()->pluck('id')->toArray();
        $tags = $blog->tags()->get()->pluck('id')->toArray();

        $relatedBlogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->whereHas('categories', function ($query) use ($categories) {
                $query->whereIn('tl_blog_categories.id', $categories);
            })
            ->whereHas('tags', function ($query) use ($tags) {
                $query->whereIn('tl_blog_tags.id', $tags);
            })
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ])
            ->select(['id', 'name', 'permalink', 'image', 'publish_at', 'views', 'formate'])
            ->orderBy('created_at', 'desc')
            ->take(3)
            ->get();

        return self::blogTranslate($relatedBlogs);
    }

    /**
     * Blog Translations Added
     */
    private static function blogTranslate($blogs)
    {
        $blogs = $blogs->map(function ($blog) {
            // Load Blog Translations
            if (count($blog->blog_translations) > 0) {
                $blog->name = $blog->blog_translations->first()->name;
            }
            unset($blog->blog_translations); // Removing Translation Record

            // Load Category Translations
            if ($blog->categories) {
                foreach ($blog->categories as $key => $category) {
                    if (count($category->category_translations) > 0) {
                        $category->name = $category->category_translations->first()->name;
                    }
                    unset($category->category_translations); // Removing Translation Record
                    unset($category->pivot); // Removing Pivot Record
                }
            }
            return $blog;
        });

        return $blogs;
    }

    /**
     * Get Popular Blog
     */
    public static function getBreakingNews()
    {
        $breakingNews = TlBlog::blogFrontTranslations()
            ->where([
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ])
            ->where('breaking_news', 1)
            ->select(['id', 'name', 'permalink'])
            ->orderBy('id', 'desc')
            ->get();

        return self::blogTranslate($breakingNews);
    }

    /**
     * Get Blog Categories with Blog Count
     */
    public static function getCategories($count)
    {
        $locale = getFrontLocale();

        $categories = TlBlogCategory::with([
            'category_translations' => function ($query) use ($locale) {
                $query->where('lang', $locale)
                    ->select(['id', 'category_id', 'name']);
            }
        ])
            ->where('is_publish', '1')
            ->select(['id', 'name', 'permalink'])
            ->withCount('blogs')
            ->orderBy('blogs_count', 'desc')
            ->take($count)
            ->get()
            ->map(function ($category) {
                if (count($category->category_translations)) {
                    $category->name = $category->category_translations->first()->name;
                }
                return $category;
            });

        return $categories;
    }

    /**
     * Get Blog Tags
     */
    public static function getTags($count)
    {
        $locale = getFrontLocale();

        $tags = TlBlogTag::with([
            'tag_translations' => function ($query) use ($locale) {
                $query->where('lang', $locale)
                    ->select(['id', 'tag_id', 'name']);
            }
        ])
            ->where('is_publish', '1')
            ->select(['id', 'name', 'permalink'])
            ->orderBy('id', 'desc')
            ->take($count)
            ->get()
            ->map(function ($tag) {
                if (count($tag->tag_translations)) {
                    $tag->name = $tag->tag_translations->first()->name;
                }
                return $tag;
            });

        return $tags;
    }

    /**
     * Get Recent Comments
     */
    public static function getRecentComments($count)
    {
        $comments = TlBlogComment::where('status', config('settings.blog_comment_status.approve'))
            ->select(['id', 'user_id', 'user_type', 'comment', 'user_name'])
            ->orderBy('id', 'desc')
            ->take($count)
            ->get();

        return $comments;
    }

    /**
     * Get Voting
     */
    public static function getVote($vote_id)
    {
        $vote = Vote::with('options')->where('id', $vote_id)->first();
        if ($vote) {
            $total_vote = $vote->options->sum('count');
            $vote->options->map(function ($option) use ($total_vote) {
                $option->percentage = $total_vote == 0 ? 0 :  round(((int)$option->count * 100) / (int)$total_vote);
                return $option;
            });
        }

        return $vote;
    }
}
