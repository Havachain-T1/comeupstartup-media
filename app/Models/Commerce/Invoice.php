<?php

namespace App\Models\Commerce;

use App\Support\Money;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $guarded = ['id'];

    protected $casts = ['billing_details' => 'array', 'issued_at' => 'datetime'];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function totalLabel(): string
    {
        return Money::format($this->total_minor, $this->currency);
    }
}
