<?php

namespace App\Models\Commerce;

use Illuminate\Database\Eloquent\Model;

class PaymentEvent extends Model
{
    protected $guarded = ['id'];

    protected $casts = ['payload' => 'array', 'processed_at' => 'datetime'];
}
