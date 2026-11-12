<?php

namespace App\Models\Commerce;

use App\Support\Money;
use Illuminate\Database\Eloquent\Model;

class ProductPackage extends Model
{
    protected $fillable = ['product_id', 'code', 'name', 'description', 'features', 'price_minor', 'currency', 'is_active', 'sort_order'];

    protected $attributes = ['is_active' => true];

    protected $casts = ['features' => 'array', 'is_active' => 'boolean', 'price_minor' => 'integer'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function priceLabel(): string
    {
        return Money::format($this->price_minor, $this->currency);
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
