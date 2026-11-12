<?php

namespace Core\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class CustomAd extends Model
{
    protected $table = "custom_ads";

    public function isActive()
    {
        if ($this->status != 1) {
            return false;
        }

        $start_date = Carbon::parse($this->start_date);

        if ($start_date->isFuture()) {
            return false;
        }

        $end_date = Carbon::parse($this->end_date);
        if ($end_date->isPast()) {
            return false;
        }



        return true;
    }
}
