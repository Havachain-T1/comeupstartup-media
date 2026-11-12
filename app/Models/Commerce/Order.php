<?php

namespace App\Models\Commerce;

use App\Models\Company\Company;
use App\Support\Money;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public const STATUS_PENDING = 'pending';
    public const STATUS_PAID = 'paid';
    public const STATUS_CANCELLED = 'cancelled';
    public const STATUS_REFUNDED = 'refunded';
    public const STATUS_PARTIALLY_REFUNDED = 'partially_refunded';

    protected $guarded = ['id'];

    protected $casts = ['paid_at' => 'datetime', 'total_minor' => 'integer', 'refunded_minor' => 'integer'];

    public function getRouteKeyName()
    {
        return 'uuid';
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function payments()
    {
        return $this->hasMany(Payment::class)->latest('id');
    }

    public function invoice()
    {
        return $this->hasOne(Invoice::class);
    }

    public function refunds()
    {
        return $this->hasMany(Refund::class);
    }

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function orderable()
    {
        return $this->morphTo();
    }

    public function isPaid(): bool
    {
        return in_array($this->status, [self::STATUS_PAID, self::STATUS_PARTIALLY_REFUNDED, self::STATUS_REFUNDED], true);
    }

    public function totalLabel(): string
    {
        return Money::format($this->total_minor, $this->currency);
    }
}
