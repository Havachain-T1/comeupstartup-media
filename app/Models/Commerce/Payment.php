<?php

namespace App\Models\Commerce;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    public const STATUS_INITIATED = 'initiated';
    public const STATUS_SUCCEEDED = 'succeeded';
    public const STATUS_FAILED = 'failed';
    public const STATUS_MISMATCH = 'amount_mismatch';

    protected $guarded = ['id'];

    protected $casts = ['meta' => 'array', 'verified_at' => 'datetime', 'amount_minor' => 'integer'];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
