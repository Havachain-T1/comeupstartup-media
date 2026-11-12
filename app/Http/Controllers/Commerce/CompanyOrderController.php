<?php

namespace App\Http\Controllers\Commerce;

use App\Http\Controllers\Controller;
use App\Models\Commerce\Order;
use App\Models\Company\Company;
use App\Services\Commerce\PaymentService;
use Illuminate\Http\Request;

class CompanyOrderController extends Controller
{
    public function index(Company $company)
    {
        $orders = Order::with('invoice')->where('company_id', $company->id)->latest('id')->paginate(20);

        return view('company.orders.index', compact('company', 'orders'));
    }

    public function show(Request $request, Company $company, Order $order)
    {
        $order = $this->scoped($company, $order)->load(['items', 'payments', 'invoice', 'refunds']);
        $member = $request->attributes->get('companyMember');

        return view('company.orders.show', compact('company', 'order', 'member'));
    }

    public function invoice(Company $company, Order $order)
    {
        $order = $this->scoped($company, $order)->load(['items', 'invoice']);
        abort_unless($order->invoice, 404);

        return view('company.orders.invoice', compact('company', 'order'));
    }

    public function pay(Request $request, Company $company, Order $order, PaymentService $payments)
    {
        [, $url] = $payments->start($this->scoped($company, $order), $request->user()->email);

        return redirect()->away($url);
    }

    private function scoped(Company $company, Order $order): Order
    {
        abort_unless((int) $order->company_id === (int) $company->id, 404);

        return $order;
    }
}
