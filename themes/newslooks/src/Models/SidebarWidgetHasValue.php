<?php

namespace Theme\NewsLooks\Models;

use Illuminate\Support\Facades\App;
use Illuminate\Database\Eloquent\Model;
use Theme\NewsLooks\Models\SidebarWidgetHasTranslateValue;

class SidebarWidgetHasValue extends Model
{
    protected $table = "tl_sidebar_widget_has_values";

    protected $guarded = [];
    public $timestamps = false;

    public function translation($field = '', $lang = false)
    {
        $lang = $lang == false ? App::getLocale() : $lang;
        $translations = $this->translations->where('lang', $lang)->first();
        return $translations != null ? $translations->$field : $this->$field;
    }

    // Widget Value Has Many Translations
    public function translations()
    {
        return $this->hasMany(SidebarWidgetHasTranslateValue::class, 'sidebar_widget_has_values_id');
    }

    // Widget Value Translation With Specific Language
    public function widgetValueTranslation($lang)
    {
        $translation = $this->translations()->where('lang', $lang)->first();
        
        if(isset($translation)){
            $default_values = empty($this->value) ? [] : json_decode($this->value, true);
            return array_replace($default_values, json_decode($translation->value, true));
        } else {
            return json_decode($this->value, true);
        }
    }
}
