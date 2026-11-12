<?php

namespace App\Models\Commerce;

use Illuminate\Database\Eloquent\Model;

class Refund extends Model
{
    public const STATUS_PENDING = 'pending';
    public const STATUS_PROCESSED = 'processed';

    protected $guarded = ['id'];

    protected $casts = ['processed_at' => 'datetime'];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
