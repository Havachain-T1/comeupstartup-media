<?php

namespace Theme\NewsLooks\Http\Controllers\Frontend;

use Carbon\Carbon;
use Core\Models\User;
use Core\Models\TlBlogTag;
use Illuminate\Http\Request;
use Core\Models\TlBlogCategory;
use App\Http\Controllers\Controller;
use Theme\NewsLooks\Repositories\BlogCommentRepository;
use Theme\NewsLooks\Repositories\FrontendBlogRepository;

class FrontendBlogController extends Controller
{
    protected $blog_options;
    public function __construct(protected FrontendBlogRepository $repository)
    {
        $this->blog_options = getThemeOption('blog', getActiveTheme()->id);
    }

    /** Blog List */
    public function blogs()
    {
        $paginate = isset($this->blog_options['blog_perpage']) && !empty($this->blog_options['blog_perpage']) ? $this->blog_options['blog_perpage'] : 10;
        
        $blogs = $this->repository->getBlogs($paginate);
        return view('theme/newslooks::frontend.pages.blogs', ['blogs' => $blogs, 'blog_options' => $this->blog_options]);
    }

    /**
     ** Blog Filter BY Category Type
     */
    public function blogByCategory($permalink)
    {
        try {
            $category = TlBlogCategory::where('permalink', $permalink)->first();

            if ($category && $category->is_publish == config('settings.general_status.active')) {
                $type = 'category';
                $blog_options = $this->blog_options;
                $paginate = isset($blog_options['blog_perpage']) && !empty($blog_options['blog_perpage']) ? $blog_options['blog_perpage'] : 10;
                
                $blogs = $this->repository->getBlogs($paginate, 'category', $category->id);
                return view('theme/newslooks::frontend.pages.blogs', compact('blogs', 'type', 'category', 'blog_options'));
            }
            abort(404);
        } catch (\Exception $e) {
            abort(404);
        }
    }

    /**
     ** Blog Filter By Tag Type
     */
    public function blogByTag($permalink)
    {
        try {
            $tag = TlBlogTag::where('permalink', $permalink)->first();

            if ($tag && $tag->is_publish == config('settings.general_status.active')) {
                $type = 'tag';
                $blog_options = $this->blog_options;
                $paginate = isset($blog_options['blog_perpage']) && !empty($blog_options['blog_perpage']) ? $blog_options['blog_perpage'] : 10;

                $blogs = $this->repository->getBlogs($paginate, 'tag', $tag->id);
                return view('theme/newslooks::frontend.pages.blogs', compact('blogs', 'type', 'tag', 'blog_options'));
            }
            abort(404);
        } catch (\Exception $e) {
            abort(404);
        }
    }


    /**
     ** Blog Search Type
     */
    public function blogBySearch($text)
    {
        try {
            $type = 'search';
            $blog_options = $this->blog_options;
            $paginate = isset($blog_options['blog_perpage']) && !empty($blog_options['blog_perpage']) ? $blog_options['blog_perpage'] : 10;

            $blogs = $this->repository->getBlogs($paginate, 'search', $text);
            return view('theme/newslooks::frontend.pages.blogs', compact('blogs', 'type', 'text', 'blog_options'));
        } catch (\Exception $e) {
            abort(404);
        }
    }

    /**
     ** Show all the blog under a author
     * @return View
     */
    public function blogByAuthor($author)
    {
        try {
            $author_name = str_replace('-', ' ', $author);
            $user = User::where('name', $author_name)->first();
            $type = 'author';
            $author_name = $user->name;
            $blog_options = $this->blog_options;
            $paginate = isset($blog_options['blog_perpage']) && !empty($blog_options['blog_perpage']) ? $blog_options['blog_perpage'] : 10;

            $blogs = $this->repository->getBlogs($paginate, 'author', $user->id);
            return view('theme/newslooks::frontend.pages.blogs', compact('blogs', 'type', 'author_name', 'author', 'blog_options'));
        } catch (\Exception $e) {
            abort(404);
        }
    }

    /**
     ** Show all the blog under a date
     * @return View
     */
    public function blogByDate($date)
    {
        try {
            $blog_date =  Carbon::create($date)->toDateString();
            $type = 'date';
            $blog_options = $this->blog_options;
            $paginate = isset($blog_options['blog_perpage']) && !empty($blog_options['blog_perpage']) ? $blog_options['blog_perpage'] : 10;

            $blogs = $this->repository->getBlogs($paginate, 'date', $blog_date);
            return view('theme/newslooks::frontend.pages.blogs', compact('blogs', 'type', 'date', 'blog_options'));
        } catch (\Exception $e) {
            abort(404);
        }
    }

    /**
     * Show Al Blog By Different Filter
     */
    public function blogByFilter($filter) 
    {
        try {
            $type = 'filter';
            $filter_text = config('newslooks.filter_text.'.$filter);
            $blog_options = $this->blog_options;
            $paginate = isset($blog_options['blog_perpage']) && !empty($blog_options['blog_perpage']) ? $blog_options['blog_perpage'] : 10;

            $blogs = $this->repository->getBlogs($paginate, $filter);
            
            return view('theme/newslooks::frontend.pages.blogs', compact('blogs', 'type', 'filter', 'filter_text', 'blog_options'));
        } catch (\Exception $e) {
            abort(404);
        }

    }

    /** Blog Details */
    public function details($permalink)
    {
        return $this->repository->blogDetails($permalink);
    }

    /**
     ** Get Blog Content for Password protected Blog
     */
    public function getBlogContent(Request $request)
    {
        return $this->repository->getBlogContent($request);
    }

    /**
     ** Get Comment For A Blog
     */
    public function loadBlogComment(Request $request)
    {
        return (new BlogCommentRepository())->getBlogComment($request);
    }

    /**
     ** Create A Blog Comment
     */
    public function createBlogComment(Request $request)
    {
        return (new BlogCommentRepository())->createComment($request);
    }
}
