<?php

namespace Theme\NewsLooks\Models;

use Illuminate\Support\Facades\App;
use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    protected $table = 'votes';
    protected $fillable = ['title', 'image', 'date'];

    /**
     * Vote has Many Options
     */
    public function options()
    {
        return $this->hasMany(VoteCount::class, 'vote_id');
    }

    /**
     * Translations
     */
    public function translation($lang)
    {
        $translate = $this->hasMany(VoteTranslation::class, 'vote_id')->where('lang', $lang)->first();
        return $translate ? $translate->title : $this->title;
    }
}
