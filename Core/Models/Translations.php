<?php

namespace Core\Models;

use Illuminate\Database\Eloquent\Model;

class Translations extends Model
{
    protected $table = "tl_translations";
    protected $fillable = ['lang_key','lang', 'lang_value'];
}
