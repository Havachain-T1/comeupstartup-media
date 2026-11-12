<?php

namespace Theme\NewsLooks\Http\Controllers\Frontend;

use Core\Models\TlPage;
use Illuminate\Http\Request;
use Theme\NewsLooks\Models\Vote;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Crypt;
use Theme\NewsLooks\Models\VoteCount;
use Theme\NewsLooks\Mail\ContactEmail;
use Illuminate\Support\Facades\Validator;

class FrontendController extends Controller
{
    /** Home Page */
    public function index()
    {
        $page_sections = '';
        $page = null;

        if (isActivePluging('newslooks-pagebuilder')) {

            $page = TlPage::where('is_home', true)->select(['id', 'page_type', 'page_image', 'content'])->first();

            if ($page != null && $page->page_type == 'builder' ) {
                $page_sections = \Plugin\NewslooksPageBuilder\Helpers\BuilderHelper::getSectionLayoutWidgets($page->id, getFrontLocale());
            }
        }
        
        return view('theme/newslooks::frontend.pages.home', compact('page', 'page_sections'));
    }

    /**
     ** Show the Details Page
     * @return View
     */
    public function pageDetails(Request $request)
    {
        try {
            $path = $request->path();
            $request_path_array = explode('/', $path);
            $permalink = end($request_path_array);

            $page = TlPage::where('permalink', $permalink)->first();
            if (!$page) {
                abort(404);
            }

            $active_theme = getActiveTheme();
            $pageOption = getThemeOption('page', $active_theme->id);

            if (isActivePluging('newslooks-pagebuilder') && $page->is_home == true) {
                return redirect()->route('home');
            }

            $page_sections = '';

            if (isActivePluging('newslooks-pagebuilder') &&  $page->page_type == 'builder') {
                $page_sections = \Plugin\NewslooksPageBuilder\Helpers\BuilderHelper::getSectionLayoutWidgets($page->id, getFrontLocale());
            }

            return view('theme/newslooks::frontend.pages.page', compact('page', 'pageOption', 'page_sections'));
        } catch (\Exception $e) {
            abort(404);
        }
    }

    /**
     * Get Content For Password Protected Page
     */
    public function getPageContent(Request $request)
    {
        try {
            $permalink = isset($request->permalink) ? $request->permalink : null;

            if (!isset($permalink)) {
                return response()->json(['error' => front_translate('Page Content Loading Failed')]);
            }

            $page = TlPage::where('permalink', $permalink)->first();

            if (!$page) {
                return response()->json(['error' => front_translate('Page Content Loading Failed')]);
            }

            if ($request->password == Crypt::decrypt($page->page_password)) {
                $content = xss_clean($page->translation('content', getFrontLocale()));
                return response()->json(['success' => 'Success', 'content' => xss_clean(fix_image_urls($content))]);
            } else {
                return response()->json(['error' => front_translate('Incorrect Password')]);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => front_translate('Page Content Loading Failed Try')]);
        }
    }

    /**
     * change frontend language
     */
    public function changeLanguage(Request $request)
    {
        cache_clear();
        $request->session()->forget('front-rtl');
        $request->session()->put('api_locale', $request->lang);
    }

    /**
     * Vote
     */
    public function vote(Request $request)
    {
        try {
            DB::beginTransaction();
            $vote_option = VoteCount::where('id', $request->option)->first();

            if ($vote_option) {
                $vote_option->increment('count');
            }

            if ($request->type && $request->type == 'change_vote') {
                VoteCount::where('id', $request->prevOption)->first()->decrement('count');
            }
            DB::commit();

            $vote = Vote::where('id', $vote_option->vote_id)->first();

            $total_vote = $vote->options->sum('count');

            $options = $vote->options->map(function ($option) use ($total_vote) {
                $option->percentage = $total_vote == 0 ? 0 : round(((int)$option->count * 100) / (int)$total_vote);
                return $option;
            });

            return response()->json([
                'options' => $options,
                'text' => front_translate('Change Vote')
            ]);
        } catch (\Throwable $th) {
            DB::rollback();
            return response()->json([
                'success' => false,
            ], 500);
        }
    }

    /**
     * Send contact email
     */
    public function sendMessage(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email',
                'name' => 'required',
                'subject' => 'required',
                'message' => 'required',
            ]);

            if ($validator->fails()) {
                toastNotification('error', front_translate('Please fill in all fields and ensure that the data entered is valid.'));
                return redirect()->back();
            }

            $active_theme = getActiveTheme();
            $contact_option = getThemeOption('contact', $active_theme->id);
            $mail_to = isset($contact_option['contact_sent_email']) ? $contact_option['contact_sent_email'] : null;

            if (!isset($mail_to)) {
                toastNotification('error', front_translate('Email sending failed. Please contact with admin'));
                return redirect()->back();
            }

            $mailData = [
                'name' => xss_clean($request['name']),
                'email' => xss_clean($request['email']),
                'message' => xss_clean($request['message']),
                'subject' => xss_clean($request['subject'])
            ];

            Mail::to($mail_to)->send(new ContactEmail($mailData));

            toastNotification('success', front_translate('Email Sent Successfully'));
            return redirect()->back();
        } catch (\Exception $e) {
            toastNotification('error', front_translate('Email sending failed. Please contact with admin'));
            return redirect()->back();
        } catch (\Error $e) {
            toastNotification('error', front_translate('Email sending failed. Please contact with admin'));
            return redirect()->back();
        }
    }
}
