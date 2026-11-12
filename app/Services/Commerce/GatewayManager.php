<?php

namespace App\Services\Commerce;

use App\Services\Commerce\Contracts\PaymentGateway;
use InvalidArgumentException;

class GatewayManager
{
    public function get(string $name): PaymentGateway
    {
        $config = config("commerce.gateways.$name");
        if (!$config) {
            throw new InvalidArgumentException("Unknown payment gateway [$name].");
        }
        if ($name === 'sandbox' && app()->environment('production')) {
            throw new InvalidArgumentException('The sandbox payment gateway cannot be used in production.');
        }

        return app()->make($config['driver'], ['config' => $config]);
    }

    public function defaultName(): string
    {
        return (string) config('commerce.default_gateway', 'sandbox');
    }
}
