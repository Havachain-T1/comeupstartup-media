<?php

namespace Theme\NewsLooks\Models;

use Illuminate\Database\Eloquent\Model;

class ThemeSidebar extends Model
{
    protected $table = "tl_theme_sidebars";

    protected $guarded = [];

    // Sidebar has many widget
    public function widgets()
    {
        return $this->hasMany(SidebarHasWidget::class, 'sidebar_id');
    }
}
