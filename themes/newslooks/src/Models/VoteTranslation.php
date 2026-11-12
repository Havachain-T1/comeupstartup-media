<?php

namespace Theme\NewsLooks\Models;

use Illuminate\Database\Eloquent\Model;

class VoteTranslation extends Model
{
    protected $table = 'vote_translations';
    protected $fillable = ['vote_id', 'title', 'lang'];
}
