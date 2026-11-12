<?php

namespace App\Support;

final class Money
{
    private const SYMBOLS = ['NGN' => '₦', 'USD' => '$', 'GBP' => '£', 'EUR' => '€'];

    public static function format(int $minor, string $currency = 'NGN'): string
    {
        $symbol = self::SYMBOLS[strtoupper($currency)] ?? (strtoupper($currency) . ' ');

        return $symbol . number_format($minor / 100, $minor % 100 === 0 ? 0 : 2);
    }
}
