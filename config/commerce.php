<?php

return [
    'currency' => env('COMMERCE_CURRENCY', 'NGN'),

    // `sandbox` simulates a hosted checkout locally and is refused in production.
    'default_gateway' => env('PAYMENT_GATEWAY', 'sandbox'),

    'gateways' => [
        'sandbox' => [
            'driver' => \App\Services\Commerce\Gateways\SandboxGateway::class,
            'secret' => env('SANDBOX_PAYMENT_SECRET', 'local-sandbox-secret'),
        ],
        'paystack' => [
            'driver' => \App\Services\Commerce\Gateways\PaystackGateway::class,
            'secret' => env('PAYSTACK_SECRET_KEY'),
            'public' => env('PAYSTACK_PUBLIC_KEY'),
            'base_url' => env('PAYSTACK_BASE_URL', 'https://api.paystack.co'),
        ],
    ],

    'invoice_prefix' => env('INVOICE_PREFIX', 'CUS-INV'),
    'order_prefix' => env('ORDER_PREFIX', 'CUS'),
];
