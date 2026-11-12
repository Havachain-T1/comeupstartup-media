<?php

namespace Theme\NewsLooks\Http\Controllers\Backend;

use Illuminate\Http\Request;
use Theme\NewsLooks\Models\Vote;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Theme\NewsLooks\Models\VoteCount;
use Theme\NewsLooks\Http\Requests\VoteRequest;
use Theme\NewsLooks\Models\VoteTranslation;

class VotingController extends Controller
{
    /**
     * Voting List
     */
    public function index()
    {
        $votes = Vote::all();
        return view('theme/newslooks::backend.vote.index', ['votes' => $votes]);
    }

    /**
     * Vote Create Page
     */
    public function create()
    {
        return view('theme/newslooks::backend.vote.create');
    }

    /**
     * New Vote Store
     */
    public function store(VoteRequest $request)
    {
        try {
            DB::beginTransaction();

            $vote = Vote::create([
                'title' => $request->title,
                'image' => $request->image,
                'date'  => $request->date
            ]);

            $options = [];

            foreach ($request->options as $option) {
                if (empty($option)) {
                    continue;
                }

                $single_option = [
                    'vote_id' => $vote->id,
                    'options' => $option,
                ];
                array_push($options, $single_option);
            }

            VoteCount::insert($options);

            DB::commit();
            toastNotification('success', translate('Vote Saved Successfully'));
            return redirect()->route('theme.newslooks.vote.index');
        } catch (\Exception $e) {
            DB::rollback();
            toastNotification('error', translate('Vote Saving Failed'));
            return redirect()->back();
        }
    }

    /**
     * Vote Edit Page
     */
    public function edit(Request $request, Vote $vote)
    {
        $languages = getAllActiveLanguages();
        $lang =  $request->lang;

        return view('theme/newslooks::backend.vote.edit', ['vote' => $vote, 'languages' => $languages, 'lang' => $lang]);
    }

    /**
     * Update Vote
     */
    public function update(VoteRequest $request, Vote $vote)
    {
        try {
            DB::beginTransaction();

            if ($request['lang'] != null && $request['lang'] != getDefaultLang()) {
                
                $vote_translation = VoteTranslation::firstOrNew(['vote_id' => $vote->id, 'lang' => $request['lang']]);
                $vote_translation->title = xss_clean($request['title']);
                $vote_translation->save();
            } else {
                $vote->update([
                    'title' => $request->title,
                    'image' => $request->image,
                    'date'  => $request->date
                ]);
            }

            $existingOptions = $vote->options()->pluck('options', 'id')->toArray();

            $receivedOptions = $request->input('options');

            $optionsToDelete = array_diff(array_keys($existingOptions), array_keys($receivedOptions));


            // Handle renaming and updating of options
            foreach ($receivedOptions as $key => $value) {

                if (array_key_exists($key, $existingOptions)) {

                    VoteCount::where('id', $key)->update(['options' => $value]);
                } else {
                    VoteCount::create([
                        'vote_id' => $vote->id,
                        'options' => $value,
                    ]);
                }
            }

            // Delete options that are no longer selected
            VoteCount::where('vote_id', $vote->id)->whereIn('id', array_values($optionsToDelete))->delete();

            DB::commit();

            toastNotification('success', translate('Vote Update Successfully'));

            return redirect()->route('theme.newslooks.vote.edit', ['vote' => $vote->id, 'lang' => $request->lang]);

        } catch (\Exception $e) {
            DB::rollback();
            toastNotification('error', translate('Vote Updating Failed'));
            return redirect()->back();
        }
    }


    /**
     * Vote Delete
     */
    public function delete(Vote $vote)
    {
        try {
            DB::beginTransaction();
            $vote->delete();
            DB::commit();
            toastNotification('success', translate('Vote Deleted Successfully'));
            return redirect()->route('theme.newslooks.vote.index');
        } catch (\Exception $e) {
            DB::rollback();
            toastNotification('error', translate('Vote Deleting Failed'));
            return redirect()->back();
        }
    }
}
