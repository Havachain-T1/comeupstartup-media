<?php

namespace App\Http\Controllers\Commerce;

use App\Http\Controllers\Controller;
use App\Services\Commerce\InvalidWebhookSignature;
use App\Services\Commerce\PaymentService;
use Illuminate\Http\Request;
use InvalidArgumentException;

class PaymentWebhookController extends Controller
{
    public function __invoke(Request $request, string $gateway, PaymentService $payments)
    {
        try {
            $outcome = $payments->handleWebhook($gateway, $request);
        } catch (InvalidWebhookSignature $e) {
            return response()->json(['message' => 'Invalid signature'], 401);
        } catch (InvalidArgumentException|\RuntimeException $e) {
            return response()->json(['message' => 'Gateway unavailable'], 404);
        }

        return response()->json(['outcome' => $outcome]);
    }
}
