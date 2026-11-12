<?php

namespace App\Models\Expert;

use Illuminate\Database\Eloquent\Model;

class ExpertVerification extends Model
{
    protected $guarded = ['id'];
    protected $casts = ['evidence' => 'array', 'reviewed_at' => 'datetime'];
}
