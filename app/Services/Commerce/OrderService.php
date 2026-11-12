<?php

namespace App\Services\Commerce;

use App\Models\Commerce\Order;
use App\Models\Commerce\ProductPackage;
use App\Models\Company\Company;
use Core\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class OrderService
{
    /** Prices always come from the stored package, never from request input or code. */
    public function createForPackage(ProductPackage $package, ?Company $company, User $user, ?Model $orderable = null): Order
    {
        if (!$package->is_active || !$package->product?->is_active) {
            throw ValidationException::withMessages(['package' => 'This package is not currently available.']);
        }

        return DB::transaction(function () use ($package, $company, $user, $orderable) {
            $order = Order::create([
                'uuid' => (string) Str::uuid(),
                'number' => $this->nextNumber(),
                'company_id' => $company?->id,
                'user_id' => $user->id,
                'status' => Order::STATUS_PENDING,
                'currency' => $package->currency,
                'subtotal_minor' => $package->price_minor,
                'total_minor' => $package->price_minor,
                'orderable_type' => $orderable?->getMorphClass(),
                'orderable_id' => $orderable?->getKey(),
            ]);
            $order->items()->create([
                'product_package_id' => $package->id,
                'product_code' => $package->product->code,
                'description' => $package->product->name . ' — ' . $package->name,
                'quantity' => 1,
                'unit_price_minor' => $package->price_minor,
                'total_minor' => $package->price_minor,
            ]);
            activity('commerce')->performedOn($order)->causedBy($user)->withProperties(['total_minor' => $order->total_minor])->log('order.created');

            return $order;
        });
    }

    private function nextNumber(): string
    {
        do {
            $number = config('commerce.order_prefix', 'CUS') . '-' . now()->format('ymd') . '-' . strtoupper(Str::random(6));
        } while (Order::where('number', $number)->exists());

        return $number;
    }
}
