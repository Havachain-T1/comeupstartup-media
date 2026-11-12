<?php

namespace Core\Http\Controllers;

use Core\Models\TlBlog;
use Illuminate\Support\Benchmark;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Core\Models\TlBlogCategory;
use Core\Models\TlBlogComment;
use Core\Models\TlPage;
use Core\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware(implode(['lice', 'nse']));
    }

    public function dashboard(Request $request)
    {

        $update_config_path = base_path('updates/config.json');
        if (file_exists($update_config_path)) {
            return view('core::base.system.update.update_dashboard');
        }

        $data['total_blog'] = $this->getBlogCount();
        $data['publish_blog'] = $this->getPublishBlogCount();
        $data['scheduled_blog'] = $this->getScheduleBlogCount();
        $data['draft_blog'] = $this->getDraftBlogCount();
        $data['pending_blog'] = $this->getPendingBlogCount();
        $data['featured_blog'] = $this->getFeaturedBlogCount();
        $data['total_pages'] = $this->getPageCount();
        $data['total_members'] = $this->getMembersCount();
        $data['total_comment'] = $this->getCommentCount();

        $data['recent_comments'] = $this->getRecentComment();
        $data['popular_categories'] = $this->getPopularCategories();
        $data['latest_blogs'] = $this->getLatestBlog();
        $data['latest_pages'] = $this->getLatestPage();
        $data['latest_members'] = $this->getLatestMembers();
        $data['most_viewed'] = $this->getMostViewed();


        return view('core::base.dashboard.index', ['data' => $data]);
    }

    /**
     * Blog Count
     */
    public function getBlogCount()
    {
        return DB::table('tl_blogs')->count();
    }

    /**
     * Publish Blog Data
     */
    public function getPublishBlogCount()
    {
        return DB::table('tl_blogs')->where([
            ['tl_blogs.is_publish', '=', config('settings.blog_status.publish')],
            ['tl_blogs.publish_at', '<', currentDateTime()]
        ])->count();
    }

    /**
     * Scheduled Blog Data
     */
    public function getScheduleBlogCount()
    {
        return DB::table('tl_blogs')->where([
            ['tl_blogs.publish_at', '>', currentDateTime()]
        ])->count();
    }

    /**
     * Draft Blog Data
     */
    public function getDraftBlogCount()
    {
        return DB::table('tl_blogs')->where([
            ['tl_blogs.is_publish', '=', config('settings.blog_status.draft')]
        ])->count();
    }

    /**
     * Pending Blog Data
     */
    public function getPendingBlogCount()
    {
        return DB::table('tl_blogs')->where([
            ['tl_blogs.is_publish', '=', config('settings.blog_status.pending')]
        ])->count();
    }

    /**
     * Featured Blog Data
     */
    public function getFeaturedBlogCount()
    {
        return DB::table('tl_blogs')->where([
            ['tl_blogs.is_featured', '=', 1]
        ])->count();
    }

    /**
     * Page Data
     */
    public function getPageCount()
    {
        return DB::table('tl_pages')->count();
    }

    /**
     * Comment Data
     */
    public function getCommentCount()
    {
        return DB::table('tl_blog_comments')->count();
    }

    /**
     * Get Members Count
     */
    public function getMembersCount()
    {
        return User::where('user_type', config('settings.user_type.user'))->count();
    }

    /**
     * Recent Comment
     */
    public function getRecentComment()
    {
        return TlBlogComment::with('blog:id,name,permalink')
            ->with('user:id,name,email,image,user_type')
            ->select(['id', 'user_id', 'blog_id', 'comment', 'parent', 'user_name', 'user_email', 'comment_date', 'user_type'])
            ->orderBy('id', 'desc')
            ->take(4)
            ->get();
    }

    /**
     * Latest Members
     */
    public function getLatestMembers()
    {
        return User::where('user_type', config('settings.user_type.user'))->orderBy('id', 'desc')->take(5)->get();
    }

    /**
     * Most Viewed Post
     */
    public function getMostViewed()
    {
        return TlBlog::select(['name', 'id', 'image', 'publish_at', 'views'])
            ->orderBy('views', 'desc')
            ->take(5)
            ->get();
    }

    /**
     * Popular Categories
     */
    public function getPopularCategories()
    {
        return TlBlogCategory::leftJoin('tl_blogs_categories', 'tl_blogs_categories.category_id', '=', 'tl_blog_categories.id')
            ->groupBy('tl_blog_categories.id')
            ->select(['tl_blog_categories.id', DB::raw('GROUP_CONCAT(distinct tl_blog_categories.name) as name'), DB::raw('COUNT(distinct tl_blogs_categories.blog_id) as blog_count')])
            ->orderBy('blog_count', 'desc')
            ->take(8)
            ->get();
    }

    /**
     * Latest Blog
     */
    public function getLatestBlog()
    {
        return TlBlog::latest()
            ->select(['name', 'id', 'image', 'publish_at'])
            ->take(5)
            ->get();
    }

    /**
     * Latest Page
     */
    public function getLatestPage()
    {
        return TlPage::latest()
            ->select(['title', 'id', 'publish_at'])
            ->take(8)
            ->get();
    }
}
