<?php

namespace Theme\NewsLooks\Repositories;

use Core\Models\TlBlog;
use Core\Models\TlBlogComment;
use Core\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Notification;
use Core\Notifications\CommentMailNotification;

class BlogCommentRepository
{
    public $comment_setting;

    public function __construct()
    {
        $this->comment_setting = commentFormSettings();
    }

    /**
     * Get Comment For a Specific Blog
     */
    public function getBlogComment($request)
    {
        try {
            if ($this->comment_setting['page_comments'] == 1) {
                $paginate = $this->comment_setting['comments_per_page'];
                $order = $this->comment_setting['comment_order'] == '1' ? 'DESC' : 'ASC';
            } else {
                $paginate = null;
                $order = 'DESC';
            }

            $blog = TlBlog::where('permalink', $request->permalink)->select(['id', 'publish_at', 'permalink'])->first();

            $blog_comments = TlBlogComment::where([
                ['comment_date', '<', currentDateTime()],
                ['blog_id', '=', $blog->id],
                ['parent', '=', null],
                ['status', '=', config('settings.blog_comment_status.approve')]
            ])
                ->with('user:id,name,image,user_type')
                ->orderBy('tl_blog_comments.comment_date', $order);

            if (isset($paginate)) {
                $blog_comments = $blog_comments->paginate($paginate);
            } else {
                $blog_comments = $blog_comments->get();
            }

            $view = view('theme/newslooks::frontend.includes.comment.blog_comment', [
                'blog' => $blog,
                'blog_comments' => $blog_comments,
                'comment_setting' => $this->comment_setting
            ])->render();

            return response()->json(['success' => front_translate('Comment Loaded Successfully'), 'view' => $view]);
        } catch (\Exception $e) {
            return response()->json(['error' => front_translate('Comment Loading Failed')]);
        }
    }

    /**
     * Get User Post Comments
     */
    public function getUserComments($request)
    {
        try {
            $status = $request->status ?? null;

            $comments = TlBlogComment::when($status, function ($query, $status) {
                if (in_array($status, config('settings.blog_comment_status_name'))) {
                    $query->where('status', config('settings.blog_comment_status.' . $status));
                }
            })
                ->where([['user_id', auth()->user()->id], ['user_type', 'user']])
                ->paginate(10);

            return view('theme/newslooks::user.back.comments', compact('comments'));
        } catch (\Exception $e) {
            toastNotification('error', translate('Comments Not Found'));
            return redirect()->back();
        }
    }

    /**
     * Create Blog Comment
     */
    public function createComment($request)
    {
        try {
            $rules = [
                'comment' => 'required'
            ];
            if (!$request->user_id) {
                if ($this->comment_setting['require_name_email'] == '1') {
                    $rules['user_name'] = 'required|max:50';
                    $rules['user_email'] = 'required|email';
                } else {
                    $rules['user_name'] = 'nullable|max:50';
                    $rules['user_email'] = 'nullable|email';
                }
            }
            $validator = Validator::make($request->all(), $rules);

            if ($validator->passes()) {

                DB::beginTransaction();

                $comment = $this->saveComment($request);
                
                $commentFiltrationResult = $this->commentFiltration($comment);

                DB::commit();

                return response()->json($commentFiltrationResult);
            }
            return response()->json(['error' => $validator->errors()->all()]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => front_translate('Comment Added Failed')]);
        }
    }

    /**
     * Comment Save to Database
     */
    protected function saveComment($request)
    {
        $blog = TlBlog::where('permalink', $request['blog_permalink'])->select(['id', 'name', 'permalink'])->first();

        $user = Auth::user();
        $user_id = $user  ? $user->id : null;
        $user_name = $user ? $user->name : ($request['user_name'] != null ? xss_clean($request['user_name']) : 'Anonymous');
        $user_email = $user ? $user->email : xss_clean($request['user_email']);
        $user_website = $user ? url('/') : xss_clean($request['user_website']);
        $user_type = $user ? ($user->user_type === config('settings.user_type.admin') ? 'admin' : 'user') : 'anonymous';

        $comment = new TlBlogComment();
        $comment->blog_id = $blog->id;
        $comment->user_id = $user_id;
        $comment->user_type = $user_type;
        $comment->user_ip_address = $_SERVER['REMOTE_ADDR'];
        $comment->user_name = $user_name;
        $comment->user_email = $user_email;
        $comment->user_website = $user_website;
        $comment->comment = xss_clean($request['comment']);
        $comment->comment_date = currentDateTime();
        $comment->parent = $request['parent'] == '' ? null : $request['parent'];
        $comment->save();

        $comment->user_agent = get_browser_name();
        $comment->blog_name = $blog->name;
        $comment->blog_permalink = $blog->permalink;

        return $comment;
    }

    /**
     ** Comment Filter before Approve
     */
    public function commentFiltration($comment)
    {
        // filter for disallowed keys
        if ($this->comment_setting['comment_disallowed_keys'] != null) {
            if ($this->disAllowedKeys($comment)) {
                return ['error' => translate('Your Comment is not Approved')];
            }
        }

        // filter for links in comment
        if ($this->commentMaxLink($comment)) {
            return ['warning' => translate('Your Comment is in Moderation')];
        }

        // filter for comment moderation
        if ($this->comment_setting['comment_moderation_keys'] != null) {
            if ($this->commentModeration($comment)) {
                return ['warning' => translate('Your Comment is in Moderation')];
            }
        }

        // checking if comment manual is on and previously approve or not
        if ($this->comment_setting['comment_moderation'] == '1') {
            if ($this->comment_setting['comment_previously_approved'] == '1') {
                if (!$this->commentPreviouslyApprove($comment)) {
                    return ['pending' => translate('Please wait for your Comment Approval')];
                }
            } else {
                return ['pending' => translate('Please wait for your Comment Approval')];
            }
        }

        $updated_comment = TlBlogComment::find($comment['id']);
        $updated_comment->status = config('settings.blog_comment_status.approve');
        $updated_comment->update();

        $updated_comment->blog_name = $comment['blog_name'];
        $updated_comment->blog_permalink = $comment['blog_permalink'];

        if ($this->comment_setting['comments_notify_email'] == 1) {
            $this->sendMail($updated_comment);
        }

        return ['success' => translate('Your Comment Added')];
    }

    /**
     ** Checking if any disallowed keys is available or not
     */
    private function disAllowedKeys($comment)
    {
        $comment_disallowed_keys = explode(',', strtolower($this->comment_setting['comment_disallowed_keys']));

        $main_comment = strtolower($comment['comment']);

        $matched_keys = [];

        foreach ($comment_disallowed_keys as $key => $value) {

            if ($this->CommentFilter($value, $main_comment)) {
                array_push($matched_keys, $this->CommentFilter($value, $main_comment));
            }

            if ($this->CommentFilter($value, $comment['user_name'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_name']));
            }

            if ($this->CommentFilter($value, $comment['user_email'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_email']));
            }

            if ($this->CommentFilter($value, $comment['user_ip_address'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_ip_address']));
            }

            if ($this->CommentFilter($value, $comment['user_agent'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_agent']));
            }

            if ($this->CommentFilter($value, $comment['user_website'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_website']));
            }
        }

        if (count($matched_keys) > 0) {
            $updated_comment = TlBlogComment::find($comment['id']);
            $updated_comment->status = config('settings.blog_comment_status.trash');
            $updated_comment->update();

            $updated_comment->blog_name = $comment['blog_name'];
            $updated_comment->blog_permalink = $comment['blog_permalink'];

            if ($this->comment_setting['comments_notify_email'] == 1) {
                $this->sendMail($updated_comment);
            }

            return true;
        } else {
            return false;
        }
    }

    /**
     ** Checking if comment has more links than the max links limit
     */
    private function commentMaxLink($comment)
    {
        $main_comment = strtolower($comment['comment']);
        if ($this->comment_setting['comment_max_links'] == 0 || $this->comment_setting['comment_max_links'] == null) {
            return false;
        } else {
            $pattern = '~[a-z]+://\S+~';
            $link_count = preg_match_all($pattern, $main_comment);

            if ($link_count >=  $this->comment_setting['comment_max_links']) {
                $updated_comment = TlBlogComment::find($comment['id']);
                $updated_comment->status = config('settings.blog_comment_status.pending');
                $updated_comment->update();

                $updated_comment->blog_name = $comment['blog_name'];
                $updated_comment->blog_permalink = $comment['blog_permalink'];

                if ($this->comment_setting['comments_notify_email'] == 1 || $this->comment_setting['comments_moderation_notify_email'] == 1) {
                    $this->sendMail($updated_comment);
                }
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     ** Checking if any moderation keys is available or not
     */
    private function commentModeration($comment)
    {

        $comment_moderation_keys = explode(',', strtolower($this->comment_setting['comment_moderation_keys']));

        $main_comment = strtolower($comment['comment']);

        $matched_keys = [];

        foreach ($comment_moderation_keys as $key => $value) {

            if ($this->CommentFilter($value, $main_comment)) {
                array_push($matched_keys, $this->CommentFilter($value, $main_comment));
            }

            if ($this->CommentFilter($value, $comment['user_name'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_name']));
            }

            if ($this->CommentFilter($value, $comment['user_email'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_email']));
            }

            if ($this->CommentFilter($value, $comment['user_ip_address'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_ip_address']));
            }

            if ($this->CommentFilter($value, $comment['user_agent'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_agent']));
            }

            if ($this->CommentFilter($value, $comment['user_website'])) {
                array_push($matched_keys, $this->CommentFilter($value, $comment['user_website']));
            }
        }

        if (count($matched_keys) > 0) {
            $updated_comment = TlBlogComment::find($comment['id']);
            $updated_comment->status = config('settings.blog_comment_status.pending');
            $updated_comment->update();

            $updated_comment->blog_name = $comment['blog_name'];
            $updated_comment->blog_permalink = $comment['blog_permalink'];

            if ($this->comment_setting['comments_notify_email'] == 1 || $this->comment_setting['comments_moderation_notify_email'] == 1) {
                $this->sendMail($updated_comment);
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     ** Checking if the authors comment was previously approve or not
     */
    private function commentPreviouslyApprove($comment)
    {
        $comment_by_email = TlBlogComment::where('user_email', $comment['user_email'])->where('status', config('settings.blog_comment_status.approve'))->exists();
        $comment_by_ip = TlBlogComment::where('user_ip_address', $comment['user_ip_address'])->where('status', config('settings.blog_comment_status.approve'))->exists();

        if ($comment_by_email || $comment_by_ip) {
            return true;
        } else {
            return false;
        }
    }

    /**
     ** Checking if Comment Match any Keywords
     */
    private function CommentFilter($value, $information)
    {
        $keys = preg_match("/{$value}/i", $information);
        return $keys ? $keys : false;
    }

    /**
     ** Sending Mail if Comment notify is on
     * @return response
     */
    public function sendMail($comment)
    {
        $emails = $this->hasBlogPermission()->toArray();
        array_push($emails, User::role('Super Admin')->first()->email);

        $comment_status = translate('A New Comment Added.');
        $comment_url = route('core.blog.comment.edit', $comment->id);
        if ($this->comment_setting['comments_moderation_notify_email'] == 1) {
            if ($comment->status == config('settings.blog_comment_status.pending')) {
                $comment_status = translate('A New Comment is Held For Moderation.');
            }
        }

        $data = [
            '_blog_link_' =>  URL::to('/') . "/post/" . $comment->blog_permalink,
            '_blog_name_' => $comment->blog_name,
            '_comment_status_' => $comment_status,
            '_author_name_' => $comment->user_name,
            '_main_comment_' => $comment->comment,
            '_comment_link_' => $comment_url,
        ];

        $keywords = getEmailTemplateVariables(config('settings.email_template.blog_comment_email_template'), true);

        $template = DB::table('tl_email_template_properties')
            ->where('email_type', config('settings.email_template.blog_comment_email_template'))
            ->select([
                'subject'
            ])->first();

        foreach ($emails as $email) {
            Notification::route('mail', $email)
                ->notify(new CommentMailNotification($data, $keywords, $template->subject));
        }
    }

    /**
     ** Get the Email of the user who has blog permission
     * @return response
     */
    public function hasBlogPermission()
    {
        $email = User::whereHas('roles', function ($query) {
            $query->whereHas('permissions', function ($query) {
                $query->where('name', 'Manage Comment');
            });
        })->pluck('email');
        return $email;
    }
}
