<?php

namespace App\Services\Commerce\Contracts;

use App\Models\Commerce\Order;

/** Implemented by an order's `orderable` model to run product-specific workflow steps. */
interface FulfilsOrders
{
    public function orderPaid(Order $order): void;

    public function orderRefunded(Order $order): void;
}
