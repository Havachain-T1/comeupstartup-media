<?php

namespace Tests\Feature\Commerce;

use App\Enums\CompanyRole;
use App\Models\Commerce\Invoice;
use App\Models\Commerce\Order;
use App\Models\Commerce\Payment;
use App\Models\Commerce\Product;
use App\Models\Company\Company;
use App\Services\Commerce\OrderService;
use App\Services\Commerce\PaymentService;
use App\Services\Company\CompanyService;
use Core\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Tests\TestCase;

class PaymentFlowTest extends TestCase
{
    use DatabaseTransactions;

    private User $owner;
    private Company $company;

    protected function setUp(): void
    {
        parent::setUp();
        $this->owner = $this->user();
        $this->company = app(CompanyService::class)->register($this->owner, ['name' => 'Pay Co ' . Str::random(4)]);
    }

    private function user(): User
    {
        return User::create(['name' => 'U', 'email' => Str::random(8) . '@example.test', 'password' => bcrypt('x'), 'status' => 1, 'user_type' => 2, 'uid' => Str::random(10)]);
    }

    private function order(int $price = 5000000): Order
    {
        $product = Product::create(['code' => 'test-' . Str::random(6), 'name' => 'Test product']);
        $package = $product->packages()->create(['code' => 'basic', 'name' => 'Basic', 'price_minor' => $price, 'currency' => 'NGN']);

        return app(OrderService::class)->createForPackage($package, $this->company, $this->owner);
    }

    private function webhook(string $reference, string $eventId, ?string $signature = null)
    {
        $body = json_encode(['id' => $eventId, 'event' => 'charge.success', 'data' => ['reference' => $reference]]);
        $sig = $signature ?? hash_hmac('sha512', $body, config('commerce.gateways.sandbox.secret'));

        return $this->call('POST', route('payments.webhook', 'sandbox'), [], [], [], ['CONTENT_TYPE' => 'application/json', 'HTTP_X_SANDBOX_SIGNATURE' => $sig], $body);
    }

    public function test_order_price_comes_from_configured_package()
    {
        $order = $this->order(17500000);
        $this->assertSame(17500000, $order->total_minor);
        $this->assertSame('₦175,000', $order->totalLabel());
        $this->assertSame(1, $order->items()->count());
    }

    public function test_sandbox_checkout_end_to_end_issues_invoice()
    {
        $order = $this->order();
        $this->actingAs($this->owner)->post(route('company.orders.pay', [$this->company, $order]))->assertRedirectContains('/payments/sandbox/');
        $payment = $order->payments()->firstOrFail();

        $this->actingAs($this->owner)->get(route('payments.sandbox.show', $payment->reference))->assertOk()->assertSee('₦50,000');
        $this->actingAs($this->owner)->post(route('payments.sandbox.complete', $payment->reference), ['outcome' => 'success'])->assertRedirect(route('payments.return', $payment->reference));
        $this->actingAs($this->owner)->get(route('payments.return', $payment->reference))->assertRedirect(route('company.orders.show', [$this->company, $order]));

        $order->refresh();
        $this->assertSame(Order::STATUS_PAID, $order->status);
        $this->assertNotNull($order->invoice);
        $this->actingAs($this->owner)->get(route('company.orders.invoice', [$this->company, $order]))->assertOk()->assertSee($order->invoice->number);
    }

    public function test_return_url_alone_does_not_mark_order_paid()
    {
        $order = $this->order();
        [$payment] = app(PaymentService::class)->start($order, 'a@example.test');
        $this->actingAs($this->owner)->get(route('payments.return', $payment->reference) . '?status=success&trxref=' . $payment->reference);
        $this->assertSame(Order::STATUS_PENDING, $order->fresh()->status);
    }

    public function test_webhook_requires_valid_signature()
    {
        $order = $this->order();
        [$payment] = app(PaymentService::class)->start($order, 'a@example.test');
        $payment->update(['meta' => ['sandbox_outcome' => 'success']]);

        $this->webhook($payment->reference, 'evt_1', 'forged')->assertStatus(401);
        $this->assertSame(Order::STATUS_PENDING, $order->fresh()->status);
        $this->call('POST', route('payments.webhook', 'unknown'), [], [], [], [], '{}')->assertNotFound();
    }

    public function test_duplicate_callbacks_are_idempotent()
    {
        $order = $this->order();
        [$payment] = app(PaymentService::class)->start($order, 'a@example.test');
        $payment->update(['meta' => ['sandbox_outcome' => 'success']]);

        $this->webhook($payment->reference, 'evt_dup')->assertOk()->assertJson(['outcome' => 'paid']);
        $this->webhook($payment->reference, 'evt_dup')->assertOk()->assertJson(['outcome' => 'duplicate']);
        $this->webhook($payment->reference, 'evt_other')->assertOk()->assertJson(['outcome' => 'already_processed']);
        $this->assertSame('already_processed', app(PaymentService::class)->verify($payment));

        $this->assertSame(1, Invoice::where('order_id', $order->id)->count());
        $this->assertSame(1, \Spatie\Activitylog\Models\Activity::where('subject_type', Order::class)->where('subject_id', $order->id)->where('description', 'order.paid')->count());
    }

    public function test_amount_mismatch_does_not_mark_order_paid()
    {
        $order = $this->order();
        [$payment] = app(PaymentService::class)->start($order, 'a@example.test');
        $payment->update(['meta' => ['sandbox_outcome' => 'success', 'sandbox_amount' => 100]]);

        $this->webhook($payment->reference, 'evt_mm')->assertJson(['outcome' => 'amount_mismatch']);
        $this->assertSame(Order::STATUS_PENDING, $order->fresh()->status);
        $this->assertSame(Payment::STATUS_MISMATCH, $payment->fresh()->status);
    }

    public function test_billing_permissions_and_company_isolation()
    {
        $order = $this->order();
        $editor = $this->user();
        $this->company->members()->create(['user_id' => $editor->id, 'role' => CompanyRole::Editor->value]);
        $this->actingAs($editor)->post(route('company.orders.pay', [$this->company, $order]))->assertForbidden();
        $this->actingAs($editor)->get(route('company.orders.index', $this->company))->assertForbidden();

        $finance = $this->user();
        $this->company->members()->create(['user_id' => $finance->id, 'role' => CompanyRole::FinanceManager->value]);
        $this->actingAs($finance)->get(route('company.orders.index', $this->company))->assertOk()->assertSee($order->number);

        $outsider = $this->user();
        $other = app(CompanyService::class)->register($outsider, ['name' => 'Other Co']);
        $this->actingAs($outsider)->get(route('company.orders.show', [$other, $order]))->assertNotFound();
        $this->actingAs($outsider)->get(route('company.orders.show', [$this->company, $order]))->assertNotFound();
        [$payment] = app(PaymentService::class)->start($order, 'a@example.test');
        $this->actingAs($outsider)->get(route('payments.return', $payment->reference))->assertNotFound();
    }

    public function test_refunds_are_tracked_against_paid_orders()
    {
        $order = $this->order();
        [$payment] = app(PaymentService::class)->start($order, 'a@example.test');
        $payment->update(['meta' => ['sandbox_outcome' => 'success']]);
        app(PaymentService::class)->verify($payment);
        $service = app(PaymentService::class);

        $service->refund($order, 1000000, 'Partial', $this->owner);
        $this->assertSame(Order::STATUS_PARTIALLY_REFUNDED, $order->fresh()->status);
        $service->refund($order, 4000000, 'Rest', $this->owner);
        $this->assertSame(Order::STATUS_REFUNDED, $order->fresh()->status);
        $this->expectException(\Illuminate\Validation\ValidationException::class);
        $service->refund($order, 1, 'Too much', $this->owner);
    }

    public function test_paystack_gateway_verifies_server_side_and_checks_signature()
    {
        config(['commerce.gateways.paystack.secret' => 'sk_test_x', 'commerce.gateways.paystack.base_url' => 'https://api.paystack.test']);
        $order = $this->order();
        Http::fake([
            'api.paystack.test/transaction/initialize' => Http::response(['status' => true, 'data' => ['authorization_url' => 'https://checkout.paystack.test/abc']]),
            'api.paystack.test/transaction/verify/*' => Http::response(['status' => true, 'data' => ['status' => 'success', 'amount' => 5000000, 'currency' => 'NGN', 'id' => 991, 'channel' => 'card']]),
        ]);
        [$payment, $url] = app(PaymentService::class)->start($order, 'a@example.test', 'paystack');
        $this->assertSame('https://checkout.paystack.test/abc', $url);

        $body = json_encode(['event' => 'charge.success', 'data' => ['id' => 991, 'reference' => $payment->reference, 'amount' => 1]]);
        $this->call('POST', route('payments.webhook', 'paystack'), [], [], [], ['CONTENT_TYPE' => 'application/json', 'HTTP_X_PAYSTACK_SIGNATURE' => 'bad'], $body)->assertStatus(401);
        $this->call('POST', route('payments.webhook', 'paystack'), [], [], [], ['CONTENT_TYPE' => 'application/json', 'HTTP_X_PAYSTACK_SIGNATURE' => hash_hmac('sha512', $body, 'sk_test_x')], $body)->assertJson(['outcome' => 'paid']);
        $this->assertSame(Order::STATUS_PAID, $order->fresh()->status);
        $this->assertSame('991', $payment->fresh()->gateway_reference);
    }
}
