<?php

namespace App\Models\Commerce;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $guarded = ['id'];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function package()
    {
        return $this->belongsTo(ProductPackage::class, 'product_package_id');
    }
}
