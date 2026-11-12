<?php

namespace Core\Http\Controllers;

use Core\Models\CustomAd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class CustomAdsController extends Controller
{

    /**
     * will return custom ads page
     */
    public function adsList(Request $request)
    {
        $custom_ads = CustomAd::orderBy('id', 'DESC')->paginate(10)->withQueryString();

        return view('core::base.ads.custom_ads', compact('custom_ads'));
    }
    /**
     * Will return new Ad page
     */
    public function addAd()
    {
        return view('core::base.ads.new_custom_ad');
    }

    /**
     * Will store a new ad
     */
    public function storeAd(Request $request)
    {
        $request->validate([
            'title' => 'required|max:250',
            'size' => 'required',
            'start_date' => 'nullable|date',
            'end_date' => 'nullable|date|after:start_date',
        ]);

        try {
            $ad = new CustomAd();
            $ad->title = $request['title'];
            $ad->size = $request['size'];
            $ad->start_date = $request['start_date'];
            $ad->end_date = $request['end_date'];
            $ad->open_ended = $request->boolean('open_ended');

            $ad->type = $request['ad_type'];

            if ($request['ad_type'] == 'image') {
                $ad->url = $request['ad_url'];
                $ad->content = $request['ad_image'];
            }

            if ($request['ad_type'] == 'adsense') {
                $ad->content = $request['adsense_code'];
            }

            if ($request['ad_type'] == 'iframe') {
                $ad->content = $request['iframe_source_url'];
            }

            $ad->save();
            toastNotification('success', 'New Ad Created Successfully');
            return to_route('core.ads.list');
        } catch (\Exception $e) {
            dd($e);
            toastNotification('error', 'Ad create failed');
            return redirect()->back();
        }
    }

    /**
     * will redirect to edit page
     */
    public function editAd($id)
    {
        $ad = CustomAd::findOrFail($id);
        return view('core::base.ads.edit_custom_ad', ['ad' => $ad]);
    }

    /**
     * Will update add
     */
    public function updateAd(Request $request)
    {
        $request->validate([
            'title' => 'required|max:250',
            'size' => 'required',
            'start_date' => 'nullable|date',
            'end_date' => 'nullable|date|after:start_date',
        ]);

        try {
            $ad = CustomAd::findOrFail($request['id']);
            $ad->title = $request['title'];
            $ad->size = $request['size'];
            $ad->start_date = $request['start_date'];
            $ad->end_date = $request['end_date'];
            $ad->open_ended = $request->boolean('open_ended');

            $ad->type = $request['ad_type'];

            if ($request['ad_type'] == 'image') {
                $ad->url = $request['ad_url'];
                $ad->content = $request['ad_image'];
            }

            if ($request['ad_type'] == 'adsense') {
                $ad->content = $request['adsense_code'];
            }

            if ($request['ad_type'] == 'iframe') {
                $ad->content = $request['iframe_source_url'];
            }

            $ad->status = $request['status'];

            $ad->save();
            toastNotification('success', 'Ad Updated Successfully');
            return to_route('core.ads.edit', ['id' => $request['id']]);
        } catch (\Exception $e) {
            toastNotification('error', 'Ad update failed');
            return redirect()->back();
        }
    }
    /**
     * Will delete a ad
     */
    public function deleteAd(Request $request)
    {
        try {
            DB::beginTransaction();
            $ad = CustomAd::findOrFail($request['id']);
            $ad->delete();
            DB::commit();
            toastNotification('success', 'Ad deleted successfully');
            return to_route('core.ads.list');
        } catch (\Exception $e) {
            toastNotification('error', 'Ad delete failed');
            return redirect()->back();
        }
    }
    /**
     * Will return ads select options
     * 
     * @param \Illuminate\Http\Request $request
     * @return JsonResponse
     */
    public function adSelectOption(Request $request)
    {
        $query = CustomAd::where('status', 1);

        if ($request->has('term')) {
            $term = trim($request->term);
            $query = $query->where('title', 'LIKE',  '%' . $term . '%');
        }

        $ads = $query->orderBy('id', 'asc')->paginate(2);

        $output = [];

        foreach ($ads->items() as $ad) {
            $item['id'] = $ad->id;
            $item['text'] = $ad->title . '-' . $ad->type . '-' . $ad->size;
            array_push($output, $item);
        }

        $morePages = true;

        if (empty($ads->nextPageUrl())) {
            $morePages = false;
        }
        $results = array(
            "results" => $output,
            "pagination" => array(
                "more" => $morePages
            )
        );

        return response()->json($results);
    }
}
