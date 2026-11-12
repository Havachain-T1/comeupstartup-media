<?php

namespace App\Models\Expert;

use Illuminate\Database\Eloquent\Model;

class ExpertSession extends Model
{
    protected $guarded = ['id'];
    protected $casts = ['scheduled_at' => 'datetime'];
}
