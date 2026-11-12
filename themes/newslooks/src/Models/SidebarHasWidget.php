<?php

namespace Theme\NewsLooks\Models;

use Illuminate\Database\Eloquent\Model;

class SidebarHasWidget extends Model
{
    protected $table = "tl_sidebar_has_widgets";
    protected $guarded = [];
    public $timestamps = false;

    // This belongs to an widget
    public function widget()
    {
        return $this->belongsTo(Widget::class, 'widget_id');
    }

    // this has many values
    public function sidebarWidgetValue()
    {
        return $this->hasOne(SidebarWidgetHasValue::class, 'sidebar_has_widget_id');
    }
}
