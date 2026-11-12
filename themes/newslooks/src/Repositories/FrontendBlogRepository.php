<?php

namespace Theme\NewsLooks\Repositories;

use Core\Models\TlBlog;
use Illuminate\Support\Facades\Crypt;
use Theme\NewsLooks\Helpers\BlogHelper;
use Share;

class FrontendBlogRepository
{

    /**
     * Get Blog List
     */
    public function getBlogs($pagination, $condition_type = '', $condition_value = '')
    {
        $condition = [
            ['publish_at', '<', currentDateTime()],
            ['is_publish', '=', config('settings.blog_status.publish')],
            ['visibility', '!=', 'private'],
        ];

        $blogs = TlBlog::categoryWithTranslations()
            ->blogFrontTranslations()
            ->with('user.info')
            ->where($condition)
            ->select([
                'id',
                'name',
                'permalink',
                'user_id',
                'image',
                'short_description',
                'visibility',
                'views',
                'publish_at',
                'is_featured',
                'formate',
            ])->orderBy('id', 'DESC');

        $blogs = $this->filterCondition($blogs, $condition_type, $condition_value);

        $blogs = $blogs->paginate($pagination);

        return $this->blogTranslation($blogs);
    }

    /**
     * Translate Blog And Category
     */
    private function blogTranslation($blogs)
    {
        $blogs->getCollection()->transform(function ($blog) {

            // Load Blog Translations
            if (count($blog->blog_translations) > 0) {

                $translations = $blog->blog_translations->first();

                $blog->name = $translations->name;
                $blog->short_description = $translations->short_description;
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
     * Blog Filter Condition
     */
    public function filterCondition($blogs_query, $condition_type, $condition_value)
    {
        if ($condition_type == 'category') {
            return $blogs_query->whereHas('categories', function ($query) use ($condition_value) {
                $query->where('category_id', $condition_value)->orderBy('publish_at', 'desc');
            });
        }

        if ($condition_type == 'tag') {
            return $blogs_query->whereHas('tags', function ($query) use ($condition_value) {
                $query->where('tag_id', $condition_value)->orderBy('publish_at', 'desc');
            });
        }

        if ($condition_type == 'search') {
            $search = app(\App\Services\Search\SearchService::class);

            return app(\App\Services\Search\Contracts\SearchEngine::class)
                ->constrainArticles($blogs_query, $search->query((string) $condition_value));
        }

        if ($condition_type == 'author') {
            return $blogs_query->where('user_id', $condition_value)->orderBy('publish_at', 'desc');
        }

        if ($condition_type == 'date') {
            return $blogs_query->whereDate('publish_at', $condition_value)->orderBy('publish_at', 'desc');
        }

        if ($condition_type == 'recent') {
            return $blogs_query->orderBy('publish_at', 'desc');
        }

        if ($condition_type == 'feature') {
            return $blogs_query->where('is_featured', config('settings.general_status.active'))->orderBy('publish_at', 'desc');
        }

        if ($condition_type == 'most_comment') {
            return $blogs_query->withCount('comments')->orderBy('comments_count', 'desc');
        }

        if ($condition_type == 'most_view') {
            return $blogs_query->withCount('comments')->orderBy('views', 'desc');
        }

        if ($condition_type == 'popular') {
            return $blogs_query->withCount('comments')->orderBy('comments_count', 'desc')->orderBy('views', 'desc');
        }

        return $blogs_query;
    }

    /**
     * Blog Details
     */
    public function blogDetails($permalink)
    {
        try {
            $active_theme = getActiveTheme();

            $conditions = [
                ['publish_at', '<', currentDateTime()],
                ['is_publish', '=',  config('settings.blog_status.publish')]
            ];

            $blog = TlBlog::with([
                'categories:id,name,permalink',
                'tags:id,name,permalink',
                'user.info'
            ])
                ->withCount('comments')
                ->where('permalink', $permalink)
                ->where($conditions)
                ->first();

            if (!$blog) {
                abort(404);
            }

            $previousBlog = TlBlog::where('created_at', '<', $blog->publish_at)
                ->where($conditions)
                ->select(['id', 'name', 'permalink', 'image', 'created_at'])
                ->orderBy('created_at', 'desc')
                ->first();

            $nextBlog = TlBlog::where('created_at', '>', $blog->publish_at)
                ->where($conditions)
                ->select(['id', 'name', 'permalink', 'image', 'created_at'])
                ->orderBy('created_at', 'asc')
                ->first();

            $relatedBlogs = BlogHelper::getRelatedBlogs($blog);

            $popularBlogs = BlogHelper::getPopularBlogs(3);

            $blog_shares = Share::load(route('theme.newslooks.blog.details', $blog->permalink), $blog->name)->services();

            $comment_setting = commentFormSettings();

            $social_options = getThemeOption('social', $active_theme->id);
            $socials = isset($social_options['social_field']) && $social_options['social_field'] != '' ? json_decode($social_options['social_field']) : null;
            $socials = isset($blog->user->info->custom_social) && $blog->user->info->custom_social != 0 && isset($blog->user->info->social) ? json_decode($blog->user->info->social) : $socials;

            $single_blog_page = getThemeOption('single_blog_page', $active_theme->id);

            $blog->increment('views');

            return view('theme/newslooks::frontend.pages.blog-details', [
                'blog' => $blog,
                'previousBlog' => $previousBlog,
                'nextBlog' => $nextBlog,
                'relatedBlogs' => $relatedBlogs,
                'popularBlogs' => $popularBlogs,
                'blog_shares' => $blog_shares,
                'socials' => $socials,
                'single_blog_page' => $single_blog_page,
                'comment_setting' => $comment_setting
            ]);
        } catch (\Exception $e) {
            abort(404);
        } catch (\Error $e) {
            abort(404);
        }
    }

    /**
     * Get Password Protected Blog Content
     */
    public function getBlogContent($request)
    {
        try {
            $permalink = isset($request->permalink) ? $request->permalink : null;

            if (!isset($permalink)) {
                return response()->json(['error' => front_translate('Post Content Loading Failed')]);
            }

            $blog = TlBlog::where('permalink', $request->permalink)->first();
            $content = $blog->translation('content', getFrontLocale());

            if ($request->is_authenticate == 'true') {
                return response()->json(['success' => 'Success', 'content' => xss_clean(fix_image_urls($content), 1)]);
            }

            if ($request->password == Crypt::decrypt($blog->blog_password)) {
                return response()->json(['success' => 'Success', 'content' => xss_clean(fix_image_urls($content))]);
            } else {
                return response()->json(['error' => front_translate('Incorrect Password')]);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => front_translate('Post Content Loading Failed')]);
        }
    }
}
