<?php

namespace App\Models\BrandPress;

use Core\Models\User;
use Illuminate\Database\Eloquent\Model;

class PressReleaseEvent extends Model
{
    public const UPDATED_AT = null;

    protected $guarded = ['id'];

    protected $casts = ['is_internal' => 'boolean'];

    public function actor()
    {
        return $this->belongsTo(User::class, 'actor_id');
    }
}
