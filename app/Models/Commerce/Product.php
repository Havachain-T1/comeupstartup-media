<?php

namespace App\Models\Commerce;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['code', 'name', 'description', 'is_active'];

    protected $attributes = ['is_active' => true];

    protected $casts = ['is_active' => 'boolean'];

    public function packages()
    {
        return $this->hasMany(ProductPackage::class)->orderBy('sort_order');
    }

    public static function byCode(string $code): ?self
    {
        return static::where('code', $code)->first();
    }
}
