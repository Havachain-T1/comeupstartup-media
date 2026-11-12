<?php

namespace Core\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class CustomAd extends Model
{
    protected $table = "custom_ads";

    public const STATE_LIVE = 'live';
    public const STATE_INACTIVE = 'inactive';
    public const STATE_SCHEDULED = 'scheduled';
    public const STATE_EXPIRED = 'expired';
    public const STATE_MISSING_DATES = 'missing_dates';

    protected $casts = [
        'open_ended' => 'boolean',
    ];

    /**
     * A blank date is only treated as "no limit" when the ad explicitly opts in via `open_ended`.
     * Previously Carbon::parse(null) resolved to "now", so every ad without an end date was hidden;
     * keeping that default means no previously hidden campaign starts showing unexpectedly.
     */
    public function displayState(?Carbon $at = null): string
    {
        $at = $at ?: Carbon::now();

        if ((int) $this->status !== 1) {
            return self::STATE_INACTIVE;
        }

        if ((empty($this->start_date) || empty($this->end_date)) && !$this->open_ended) {
            return self::STATE_MISSING_DATES;
        }

        if (!empty($this->start_date) && Carbon::parse($this->start_date)->gt($at)) {
            return self::STATE_SCHEDULED;
        }

        if (!empty($this->end_date) && Carbon::parse($this->end_date)->lte($at)) {
            return self::STATE_EXPIRED;
        }

        return self::STATE_LIVE;
    }

    public function isActive()
    {
        return $this->displayState() === self::STATE_LIVE;
    }
}
