<?php

return [
    // `fake` returns deterministic text for local development and tests; it is refused in production.
    'provider' => env('AI_PROVIDER', 'fake'),

    'providers' => [
        'fake' => ['driver' => \App\Services\AI\Providers\FakeProvider::class, 'model' => 'fake-1'],
        'openai' => [
            'driver' => \App\Services\AI\Providers\OpenAiProvider::class,
            // Falls back to the legacy open_ai_settings.api_key row when unset.
            'key' => env('OPENAI_API_KEY', env('OPEN_AI_KEY')),
            'base_url' => env('OPENAI_BASE_URL', 'https://api.openai.com/v1'),
            'model' => env('OPENAI_MODEL', 'gpt-4o-mini'),
            'timeout' => 45,
        ],
    ],

    // USD per million tokens [input, output]; used for the cost ledger only.
    'pricing' => [
        'gpt-4o-mini' => [0.15, 0.60],
        'gpt-4o' => [2.50, 10.00],
        'fake-1' => [0, 0],
    ],

    'limits' => [
        'user_daily_requests' => (int) env('AI_USER_DAILY_LIMIT', 50),
        'company_monthly_requests' => (int) env('AI_COMPANY_MONTHLY_LIMIT', 100),
        'max_input_chars' => 8000,
        'max_output_tokens' => 1200,
        'per_minute' => (int) env('AI_RATE_LIMIT', 10),
    ],
];
