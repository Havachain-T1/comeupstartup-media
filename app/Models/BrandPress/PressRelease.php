<?php

namespace App\Models\BrandPress;

use App\Models\Commerce\Order;
use App\Models\Commerce\ProductPackage;
use App\Models\Company\Company;
use App\Services\BrandPress\BrandPressWorkflow;
use App\Services\Commerce\Contracts\FulfilsOrders;
use Core\Models\TlBlog;
use Core\Models\User;
use Illuminate\Database\Eloquent\Model;

class PressRelease extends Model implements FulfilsOrders
{
    public const DRAFT = 'draft';
    public const SUBMITTED = 'submitted';
    public const AWAITING_PAYMENT = 'awaiting_payment';
    public const PAID = 'paid';
    public const UNDER_REVIEW = 'under_review';
    public const CHANGES_REQUESTED = 'changes_requested';
    public const APPROVED = 'approved';
    public const SCHEDULED = 'scheduled';
    public const PUBLISHED = 'published';
    public const REJECTED = 'rejected';
    public const REFUNDED = 'refunded';

    public const LABELS = [
        self::DRAFT => 'Draft', self::SUBMITTED => 'Submitted', self::AWAITING_PAYMENT => 'Awaiting payment',
        self::PAID => 'Paid', self::UNDER_REVIEW => 'Under review', self::CHANGES_REQUESTED => 'Changes requested',
        self::APPROVED => 'Approved', self::SCHEDULED => 'Scheduled', self::PUBLISHED => 'Published',
        self::REJECTED => 'Rejected', self::REFUNDED => 'Refunded',
    ];

    public const TONES = [
        self::PAID => 'info', self::UNDER_REVIEW => 'info', self::AWAITING_PAYMENT => 'warning', self::CHANGES_REQUESTED => 'warning',
        self::APPROVED => 'success', self::SCHEDULED => 'success', self::PUBLISHED => 'success', self::REJECTED => 'danger', self::REFUNDED => 'danger',
    ];

    protected $fillable = ['title', 'summary', 'body', 'contact_name', 'contact_email'];

    protected $casts = ['submitted_at' => 'datetime', 'scheduled_for' => 'datetime', 'published_at' => 'datetime', 'ai_assisted' => 'boolean'];

    public function getRouteKeyName()
    {
        return 'uuid';
    }

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }

    public function package()
    {
        return $this->belongsTo(ProductPackage::class, 'product_package_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function blog()
    {
        return $this->belongsTo(TlBlog::class, 'blog_id');
    }

    public function events()
    {
        return $this->hasMany(PressReleaseEvent::class)->orderBy('id');
    }

    public function statusLabel(): string
    {
        return self::LABELS[$this->status] ?? ucfirst($this->status);
    }

    public function statusTone(): string
    {
        return self::TONES[$this->status] ?? 'neutral';
    }

    public function isEditableByCompany(): bool
    {
        return in_array($this->status, [self::DRAFT, self::CHANGES_REQUESTED], true);
    }

    public function orderPaid(Order $order): void
    {
        app(BrandPressWorkflow::class)->markPaid($this);
    }

    public function orderRefunded(Order $order): void
    {
        app(BrandPressWorkflow::class)->markRefunded($this);
    }
}
