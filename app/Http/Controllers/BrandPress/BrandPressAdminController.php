<?php

namespace App\Http\Controllers\BrandPress;

use App\Http\Controllers\Controller;
use App\Models\BrandPress\PressRelease;
use App\Services\BrandPress\BrandPressWorkflow;
use App\Services\Commerce\PaymentService;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BrandPressAdminController extends Controller
{
    public function index(Request $request)
    {
        $status = $request->query('status', 'queue');
        $releases = PressRelease::with('company:id,name', 'package:id,name')
            ->when($status === 'queue', fn ($q) => $q->whereIn('status', [PressRelease::PAID, PressRelease::UNDER_REVIEW, PressRelease::APPROVED]))
            ->when($status !== 'queue' && $status !== 'all', fn ($q) => $q->where('status', $status))
            ->orderByRaw("FIELD(status, 'paid', 'under_review', 'approved') DESC")->latest('id')->paginate(25)->withQueryString();

        return view('admin.brand-press.index', compact('releases', 'status'));
    }

    public function show(PressRelease $release, BrandPressWorkflow $workflow)
    {
        $release->load(['company', 'events.actor:id,name', 'order.payments', 'package', 'author:id,name,email']);

        return view('admin.brand-press.show', compact('release', 'workflow'));
    }

    public function action(Request $request, PressRelease $release, BrandPressWorkflow $workflow, PaymentService $payments)
    {
        $data = $request->validate([
            'action' => 'required|in:start_review,request_changes,approve,reject,schedule,publish,refund',
            'note' => 'nullable|string|max:5000|required_if:action,request_changes,reject',
            'scheduled_for' => 'nullable|date|required_if:action,schedule',
        ]);
        $editor = $request->user();

        match ($data['action']) {
            'start_review' => $workflow->startReview($release, $editor),
            'request_changes' => $workflow->requestChanges($release, $editor, $data['note']),
            'approve' => $workflow->approve($release, $editor, $data['note'] ?? null),
            'reject' => $workflow->reject($release, $editor, $data['note']),
            'schedule' => $workflow->schedule($release, $editor, Carbon::parse($data['scheduled_for'])),
            'publish' => $workflow->publish($release, $editor),
            'refund' => $this->refund($release, $editor, $payments),
        };

        return redirect()->route('admin.brand-press.show', $release)->with('success', __('Updated: :status', ['status' => $release->fresh()->statusLabel()]));
    }

    private function refund(PressRelease $release, $editor, PaymentService $payments): void
    {
        abort_unless($release->status === PressRelease::REJECTED && $release->order?->isPaid(), 422, 'Only paid, rejected announcements can be refunded.');
        $order = $release->order;
        $payments->refund($order, $order->total_minor - $order->refunded_minor, 'Brand Press submission rejected', $editor);
    }
}
