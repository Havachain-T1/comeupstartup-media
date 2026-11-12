<?php

namespace Core\Http\Controllers;

use Core\Models\TlBlog;
use Share;
use Core\Models\TlBlogTag;
use Illuminate\Http\Request;
use Core\Models\TlBlogCategory;
use Core\Models\BlogShareOption;
use Illuminate\Support\Facades\DB;
use Core\Http\Requests\BlogRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Core\Repositories\BlogRepository;
use Illuminate\Support\Facades\Crypt;
use Theme\NewsLooks\Helpers\BlogHelper;
use Core\Repositories\LanguageRepository;
use Illuminate\Support\Facades\Validator;

class BlogController extends Controller
{

  protected $language_repository;
  protected $blog_repository;


  public function __construct(LanguageRepository $language_repository, BlogRepository $blog_repository)
  {
    $this->language_repository = $language_repository;
    $this->blog_repository = $blog_repository;
  }

  /**
   ** Show all the blogs from database and get all the categories under the blogs
   * @return mixed
   */
  public function blog(Request $request)
  {
    try {
      $data = [
        DB::raw('GROUP_CONCAT(distinct tl_blogs.id) as id'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.formate) as formate'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.name) as name'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.permalink) as permalink'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.image) as image'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.visibility) as visibility'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.publish_at) as publish_at'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.is_featured) as is_featured'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.is_publish) as is_publish'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.updated_at) as updated_at'),
        DB::raw('GROUP_CONCAT(distinct tl_users.name) as user_name'),
        DB::raw('GROUP_CONCAT(distinct tl_users.image) as user_image'),
        DB::raw('GROUP_CONCAT(distinct tl_blog_categories.id) as category'),
      ];

      $match_case = [];
      $pagination = 10;
      $search = '';

      if ($request->per_page) {
        $pagination = (int)$request->per_page;
      }

      if ($request->status) {

        switch ($request->status) {
          case 'mine':
            array_push($match_case, ['tl_blogs.user_id', '=', Auth::user()->id]);
            break;
          case 'publish':
            array_push($match_case, ['tl_blogs.is_publish', '=', config('settings.blog_status.publish')]);
            array_push($match_case, ['tl_blogs.publish_at', '<', currentDateTime()]);
            break;
          case 'schedule':
            array_push($match_case, ['tl_blogs.publish_at', '>', currentDateTime()]);
            break;
          case 'draft':
            array_push($match_case, ['tl_blogs.is_publish', '=', config('settings.blog_status.draft')]);
            break;
          case 'pending':
            array_push($match_case, ['tl_blogs.is_publish', '=',  config('settings.blog_status.pending')]);
            break;
          case 'featured':
            array_push($match_case, ['tl_blogs.is_featured', '=',  1]);
            break;
          case 'search_text':
            $match_case;
            break;
          default:
            toastNotification('error', translate('Post Comment Not Found'));
            return redirect()->back();
            break;
        }

        if ($request->search) {
          $search = $request->search;
        }
      }

      $blogs = $this->blog_repository->getBlogs($data, $match_case, null, $pagination, $search);

      return view('core::base.blog.blog', compact('blogs'));
    } catch (\Exception $e) {

      toastNotification('error', translate('Posts Not Found'));
      return redirect()->back();
    }
  }

  public function BreakingNews(Request $request)
  {
    try {
      $data = [
        DB::raw('GROUP_CONCAT(distinct tl_blogs.id) as id'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.formate) as formate'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.breaking_news) as breaking_news'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.name) as name'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.permalink) as permalink'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.image) as image'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.visibility) as visibility'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.publish_at) as publish_at'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.is_featured) as is_featured'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.is_publish) as is_publish'),
        DB::raw('GROUP_CONCAT(distinct tl_blogs.updated_at) as updated_at'),
        DB::raw('GROUP_CONCAT(distinct tl_users.name) as user_name'),
        DB::raw('GROUP_CONCAT(distinct tl_users.image) as user_image'),
        DB::raw('GROUP_CONCAT(distinct tl_blog_categories.id) as category'),
      ];

      $match_case = [['tl_blogs.breaking_news', '=', 1]];
      $pagination = 10;
      $search = '';

      if ($request->per_page) {
        $pagination = (int)$request->per_page;
      }

      if ($request->status) {

        switch ($request->status) {
          case 'mine':
            array_push($match_case, ['tl_blogs.user_id', '=', Auth::user()->id]);
            break;
          case 'publish':
            array_push($match_case, ['tl_blogs.is_publish', '=', config('settings.blog_status.publish')]);
            array_push($match_case, ['tl_blogs.publish_at', '<', currentDateTime()]);
            break;
          case 'schedule':
            array_push($match_case, ['tl_blogs.publish_at', '>', currentDateTime()]);
            break;
          case 'draft':
            array_push($match_case, ['tl_blogs.is_publish', '=', config('settings.blog_status.draft')]);
            break;
          case 'pending':
            array_push($match_case, ['tl_blogs.is_publish', '=',  config('settings.blog_status.pending')]);
            break;
          case 'featured':
            array_push($match_case, ['tl_blogs.is_featured', '=',  1]);
            break;
          case 'search_text':
            $match_case;
            break;
          default:
            toastNotification('error', translate('Post Comment Not Found'));
            return redirect()->back();
            break;
        }

        if ($request->search) {
          $search = $request->search;
        }
      }

      $blogs = $this->blog_repository->getBlogs($data, $match_case, null, $pagination, $search);

      return view('core::base.blog.breaking_news', compact('blogs'));
    } catch (\Exception $e) {

      dd($e);
      toastNotification('error', translate('Posts Not Found'));
      return redirect()->back();
    }
  }

  /**
   ** Add Blog
   * @return mixed
   */
  public function addBlog()
  {
    try {
      $categories = $this->blog_repository->getParentCategories([['is_publish', '1']]);
      $tags = $this->blog_repository->getAllTags();

      return view('core::base.blog.add_blog', compact('categories', 'tags'));
    } catch (\Exception $e) {

      toastNotification('error', translate('Something Went Wrong'));
      return redirect()->route('core.blog');
    }
  }

  /**
   ** Store a new blog as Publish to DB
   * @param \Core\Http\Requests\BlogRequest $request
   * @return \Illuminate\Http\Response
   */

  public function storeBlog(BlogRequest $request)
  {
    try {
      DB::beginTransaction();
      $blog = $this->blog_repository->blogCreateUpdate($request, isset($request->id) ? $request->id : null);
      DB::commit();

      toastNotification('success', translate('New Post Added Successfully'));
      return redirect()->route('core.edit.blog', ['id' => $blog->id, 'lang' => getDefaultLang()]);
    } catch (\Exception $e) {
      DB::rollBack();
      toastNotification('error', translate('New Post Saving Failed'));
      return redirect()->route('core.add.blog');
    }
  }

  /**
   ** Edit Blog
   * @param \App\Models\Blog $id
   * @return \Illuminate\Http\Response
   */
  public function editBlog(Request $request, $id)
  {
    try {
      if (isset($request->id) && is_numeric($request->id) && $request->lang) {

        $languages = $this->language_repository->allLanguages();
        $lang =  $request->lang;

        $blog = $this->blog_repository->findBlogByID($id);
        $blog->content = fix_image_urls($blog->content);
        $blog->blog_password = isset($blog->blog_password) ? Crypt::decrypt($blog->blog_password) : null;
        $categories = $this->blog_repository->getParentCategories();
        $tags = $this->blog_repository->getAllTags();

        return view('core::base.blog.edit_blog', compact('blog', 'categories', 'tags', 'languages', 'lang'));
      } else {
        toastNotification('error', translate('Post not found'));
        return redirect()->route('core.blog');
      }
    } catch (\Exception $e) {
      toastNotification('error', translate('Post not found'));
      return redirect()->route('core.blog');
    }
  }

  /**
   ** Update Blog
   * @param \App\Http\Requests\BlogRequest $request
   * @return \Illuminate\Http\Response
   */
  public function updateBlog(BlogRequest $request)
  {
    try {
      if (isset($request->id) && is_numeric($request->id)  && $request->lang) {

        $this->blog_repository->blogUpdate($request);
        toastNotification('success', translate('Post Updated Successfully'));

        return redirect()->route('core.edit.blog', ['id' =>  $request->id, 'lang' => $request->lang]);
      } else {
        toastNotification('error', translate('Post Update Failed'));
        return redirect()->route('core.edit.blog', ['id' =>  $request->id, 'lang' => $request->lang]);
      }
    } catch (\Exception $e) {
      toastNotification('error', translate('Post Update Failed'));
      return redirect()->back();
    }
  }

  /**
   ** Delete Blog
   * @param \App\Models\Blog $id
   * @return \Illuminate\Http\Response
   */
  public function deleteBlog(Request $request)
  {
    try {
      if (isset($request->permalink)) {

        DB::beginTransaction();
        $this->blog_repository->deleteBlog($request->permalink);
        DB::commit();

        toastNotification('success', translate('Post Deleted Successfully'));
      } else {
        toastNotification('error', translate('Post Deleting Failed'));
      }
    } catch (\Exception $e) {
      DB::rollBack();
      toastNotification('error', translate('Post Deleting Failed'));
    } catch (\Error $e) {
      toastNotification('error', translate('Error in Code'));
    }

    return redirect()->route('core.blog');
  }

  /**
   ** Blog Draft Preview
   * @param \Illuminate\Http\Request $request
   * @return \Illuminate\Http\Response
   */
  public function blogDraftPreview(Request $request)
  {
    try {
      if (!isset($request->name)) {
        return response()->json(['error' => translate('Name Field is Required')]);
      }
      if (strlen($request->name) > 225) {
        return response()->json(['error' => translate('Please Write The Post Name under 225 words')]);
      }

      if (!$request->id && (TlBlog::where('permalink', $request->permalink)->exists() || TlBlog::where('name', $request->name)->exists())) {
        return response()->json(['error' => translate('This Post Name or Permalink is Already Available Please Insert Different Name or Permalink')]);
      }

      DB::beginTransaction();
      $blog = $this->blog_repository->blogCreateUpdate($request, isset($request->id) ? $request->id : null, $request->action);
      DB::commit();

      switch ($request->action) {
        case 'draft':
          return response()->json(['success' => translate('Post Draft Saved'), 'id' => $blog->id]);
          break;

        case 'preview':
          return response()->json(['id' => $blog->id, 'permalink' => $blog->permalink]);
          break;

        case 'pending':
          return response()->json(['success' => translate('Post Saved as Pending'), 'id' => $blog->id]);
          break;
      }
    } catch (\Exception $e) {
      DB::rollBack();
      return response()->json(['error' => translate('Post Saved Failed') . $e->getMessage()]);
    }
  }

  /**
   ** blog preview page
   * @param \Illuminate\Http\Request $request via ajax
   * @return View
   */
  public function blogPreview(Request $request)
  {

    try {
      // $page = $this->blog_repository->findBlog($request->name);
      // $blog_category = $this->blog_repository->getBlogCategory($page->id);
      // $page->category = $blog_category;
      // $blog_tag = $this->blog_repository->getBlogTag($page->id);
      // $page->tag = $blog_tag;
      // return view('theme/newslooks::backend.page_preview', compact('page'));

      $active_theme = getActiveTheme();

      $conditions = [
        ['publish_at', '<', currentDateTime()],
        ['is_publish', '=',  config('settings.blog_status.publish')]
      ];

      $page = $this->blog_repository->findBlog($request->name);

      $blog = TlBlog::with([
        'categories:id,name,permalink',
        'tags:id,name,permalink',
        'user.info'
      ])
        ->withCount('comments')
        ->where('id', $page->id)
        ->first();

      if (!$blog) {
        abort(404);
      }

      $previousBlog = null;

      $nextBlog = null;

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
    }
  }

  /**
   * Bulk Delete Blog
   * @param \Illuminate\Http\Request $request (Via Ajax)
   * @return \Illuminate\Http\Response (Via Ajax)
   */
  public function bulkDeleteBlog(Request $request)
  {
    try {
      if ($request->has('data')) {
        DB::beginTransaction();
        $this->blog_repository->bulkDeleteBlog($request->data);
        DB::commit();
        toastNotification('success', translate('Posts Bulk Delete Successful'));
      } else {

        toastNotification('error', translate('Posts Bulk Deleting Failed'));
      }
    } catch (\Exception $e) {
      DB::rollBack();
      toastNotification('error', translate('Posts Bulk Deleting Failed'));
    }
  }

  /**
   * Update featured status
   *
   * @param \Illuminate\Http\Request $request (Via Ajax)
   * @return \Illuminate\Http\Response (Via Ajax)
   */
  public function updateBlogFeaturedStatus(Request $request)
  {
    try {

      if ($request->id && is_numeric($request->id)) {

        DB::beginTransaction();
        $result = $this->blog_repository->updateBlogFeaturedStatus($request->id);
        DB::commit();

        return response()->json(['success' => translate('Post Featured Status Changed Successfully'), 'result' => $result]);
      } else {
        return response()->json(['error' => translate('Post Featured Status Changing Failed')]);
      }
    } catch (\Exception $e) {
      DB::rollBack();
      return response()->json(['error' => translate('Post Featured Status Changing Failed')]);
    }
  }

  /**
   ** Blog Content (Summernote) Image Upload and validate to send a response
   * @param \Illuminate\Http\Request $request
   * @return mixed
   */
  public function blogContentImage(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'image' => 'required|image|mimes:jpg,png,svg,jpeg,bmp|max:1020',
    ]);

    if ($validator->passes()) {

      if ($request->hasFile('image')) {
        $file = $request->file('image');
        $file_id = saveFileInStorage($file);

        $path = getFilePath($file_id);

        return response()->json(['url' => $path]);
      }
    }
    return response()->json(['error' => $validator->errors()->all()]);
  }

  /**
   ** Ajax Category Load
   * @param Request via Ajax
   * @return mixed|array
   */
  public function categoryLoad(Request $request)
  {
    try {
      if ($request->category) {
        if (TlBlogCategory::where('permalink', $request->permalink)->exists() || TlBlogCategory::where('name', $request->category)->exists()) {
          return response()->json(['error' => translate('This Category Name or Slug is Already Available Please Insert Another')]);
        }

        DB::beginTransaction();
        $id = $this->blog_repository->categorySaveLoad($request);
        DB::commit();
      } else {
        $id = null;
      }

      if ($request->id) {
        $blog_category = $this->blog_repository->getBlogCategory($request->id);
      } else {
        $blog_category = null;
      }

      $categories = $this->blog_repository->getParentCategories();
      $view = view('core::base.blog.includes.category-select', compact('categories', 'blog_category'))->render();
      return response()->json(['view' => $view, 'id' => $id, 'blog_category' => $blog_category]);
    } catch (\Exception $e) {
      DB::rollBack();
      return response()->json(['error' => translate('New Category Creating Failed')]);
    }
  }

  /**
   ** Ajax Tag Load
   * @param Request via Ajax
   * @return mixed|array
   */
  public function TagLoad(Request $request)
  {
    try {
      if ($request->tag) {

        if (TlBlogTag::where('permalink', $request->permalink)->exists() || TlBlogTag::where('name', $request->tag)->exists()) {
          return response()->json(['error' => translate('This Tag Name or Slug is Already Available Please Insert Another')]);
        }

        DB::beginTransaction();
        $id = $this->blog_repository->tagSaveLoad($request);
        DB::commit();
      } else {
        $id = null;
      }

      if ($request->id) {
        $blog_tag = $this->blog_repository->getBlogTag($request->id);
      } else {
        $blog_tag = null;
      }

      $tags = $this->blog_repository->getAllTags();
      $view = view('core::base.blog.includes.tag-select', compact('tags', 'blog_tag'))->render();

      return response()->json(['view' => $view, 'id' => $id]);
    } catch (\Exception $e) {
      DB::rollBack();
      return response()->json(['error' => translate('New Tag Creating Failed')]);
    }
  }


  /**
   * Will return blog share options
   * 
   * @return mixed
   */
  public function shareOptions()
  {
    $share_options = BlogShareOption::all();
    return view('core::base.blog.settings.share_options')->with(
      [
        'share_options' => $share_options,
      ]
    );
  }

  /**
   * Update status of blog share option
   * 
   * @param \Illuminate\Http\Request $request
   * @return void
   */
  public function shareOptionUpdateStatus(Request $request)
  {
    try {
      DB::beginTransaction();
      $option = BlogShareOption::find($request['id']);
      $option->status = $option->status == config('settings.general_status.active') ? config('settings.general_status.in_active') : config('settings.general_status.active');
      $option->save();
      DB::commit();
      toastNotification('success', translate('Status updated successfully'));
    } catch (\Exception $e) {
      DB::rollBack();
      toastNotification('error', translate('Status update failed'));
    }
  }
}
