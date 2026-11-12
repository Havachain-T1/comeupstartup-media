<?php

namespace Theme\NewsLooks\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\Newsletter\NewsletterFacade;
use Illuminate\Support\Facades\Validator;

class NewsletterController extends Controller
{
    /**
     ** Newsletter Subscriber Store
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email'
        ]);

        if ($validator->fails()) {
            toastNotification('error', front_translate('Please Enter a Valid Email'));
            return redirect()->back();
        }

        $mailchimp_api_key = env('MAILCHIMP_APIKEY');
        $mailchimp_list_id = env('MAILCHIMP_LIST_ID');

        if ($mailchimp_api_key == '' || $mailchimp_list_id == '') {
            toastNotification('error', front_translate('Newsletter Subscribing Failed. Please Contact With Admin'));
            return redirect()->back();
        }

        if (!NewsletterFacade::isSubscribed($request->email)) {
            NewsletterFacade::subscribePending($request->email);
            toastNotification('success', front_translate('Please Check your Email to confirm your Subscription'));
            return redirect()->back();
        }

        toastNotification('success', front_translate('This Email is already Subscribed'));
        return redirect()->back();
    }
}
