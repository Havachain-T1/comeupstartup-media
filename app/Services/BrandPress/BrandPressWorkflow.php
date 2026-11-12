<?php

namespace App\Services\BrandPress;

use App\Models\BrandPress\PressRelease as PR;
use App\Models\Commerce\ProductPackage;
use App\Models\Company\CompanyMember;
use App\Services\Commerce\OrderService;
use Carbon\Carbon;
use Core\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

/**
 * Brand Press state machine. Payment only moves a release to `paid`; publication always needs an
 * editor's explicit approval.
 */
class BrandPressWorkflow
{
    private const TRANSITIONS = [
        PR::DRAFT => [PR::SUBMITTED],
        PR::SUBMITTED => [PR::AWAITING_PAYMENT],
        PR::AWAITING_PAYMENT => [PR::PAID, PR::DRAFT],
        PR::PAID => [PR::UNDER_REVIEW],
        PR::UNDER_REVIEW => [PR::CHANGES_REQUESTED, PR::APPROVED, PR::REJECTED],
        PR::CHANGES_REQUESTED => [PR::UNDER_REVIEW],
        PR::APPROVED => [PR::SCHEDULED, PR::PUBLISHED],
        PR::SCHEDULED => [PR::PUBLISHED],
        PR::REJECTED => [PR::REFUNDED],
        PR::PUBLISHED => [],
        PR::REFUNDED => [],
    ];

    public function __construct(private OrderService $orders)
    {
    }

    public function createDraft(CompanyMember $member, array $data): PR
    {
        $release = new PR($data);
        $release->uuid = (string) Str::uuid();
        $release->company_id = $member->company_id;
        $release->author_id = $member->user_id;
        $release->status = PR::DRAFT;
        $release->ai_assisted = (bool) ($data['ai_assisted'] ?? false);
        $release->save();
        $this->log($release, null, PR::DRAFT, $member->user_id, 'Draft created');

        return $release;
    }

    public function update(PR $release, array $data): void
    {
        if (!$release->isEditableByCompany()) {
            throw ValidationException::withMessages(['status' => 'This announcement can no longer be edited.']);
        }
        $release->fill($data);
        if (!empty($data['ai_assisted'])) {
            $release->ai_assisted = true;
        }
        $release->save();
    }

    /** Draft → Submitted → Awaiting payment (order created from the stored package price). */
    public function submit(PR $release, CompanyMember $member, ProductPackage $package): PR
    {
        if ($package->product?->code !== config('brand_press.product_code')) {
            throw ValidationException::withMessages(['package' => 'Choose a Brand Press package.']);
        }

        return DB::transaction(function () use ($release, $member, $package) {
            $release = PR::whereKey($release->id)->lockForUpdate()->first();
            $this->transition($release, PR::SUBMITTED, $member->user_id, 'Submitted with package ' . $package->name);
            $release->forceFill(['submitted_at' => now(), 'product_package_id' => $package->id])->save();

            $user = User::findOrFail($member->user_id);
            $order = $this->orders->createForPackage($package, $release->company, $user, $release);
            $release->forceFill(['order_id' => $order->id])->save();
            $this->transition($release, PR::AWAITING_PAYMENT, null, 'Order ' . $order->number . ' created');

            return $release;
        });
    }

    public function resubmit(PR $release, CompanyMember $member, ?string $note = null): void
    {
        $this->transition($release, PR::UNDER_REVIEW, $member->user_id, $note ?: 'Revised and resubmitted');
    }

    public function markPaid(PR $release): void
    {
        DB::transaction(function () use ($release) {
            $release = PR::whereKey($release->id)->lockForUpdate()->first();
            if ($release->status === PR::AWAITING_PAYMENT) {
                $this->transition($release, PR::PAID, null, 'Payment confirmed — queued for editorial review');
            }
        });
    }

    public function startReview(PR $release, User $editor): void
    {
        $release->forceFill(['reviewer_id' => $editor->id]);
        $this->transition($release, PR::UNDER_REVIEW, $editor->id, 'Editorial review started');
    }

    public function requestChanges(PR $release, User $editor, string $note): void
    {
        $this->transition($release, PR::CHANGES_REQUESTED, $editor->id, $note);
    }

    public function approve(PR $release, User $editor, ?string $note = null): void
    {
        $this->transition($release, PR::APPROVED, $editor->id, $note ?: 'Approved for publication');
    }

    public function reject(PR $release, User $editor, string $note): void
    {
        $this->transition($release, PR::REJECTED, $editor->id, $note);
    }

    public function schedule(PR $release, User $editor, Carbon $when): void
    {
        if ($when->isPast()) {
            throw ValidationException::withMessages(['scheduled_for' => 'Choose a future publication time.']);
        }
        $release->forceFill(['scheduled_for' => $when]);
        $this->transition($release, PR::SCHEDULED, $editor->id, 'Scheduled for ' . $when->toDayDateTimeString());
    }

    public function publish(PR $release, ?User $editor = null): void
    {
        DB::transaction(function () use ($release, $editor) {
            $release = PR::whereKey($release->id)->lockForUpdate()->first();
            $this->assertAllowed($release, PR::PUBLISHED);
            $release->forceFill(['blog_id' => $this->createArticle($release, $editor), 'published_at' => now()]);
            $this->transition($release, PR::PUBLISHED, $editor?->id, 'Published');
        });
    }

    public function publishDue(): int
    {
        $count = 0;
        PR::where('status', PR::SCHEDULED)->where('scheduled_for', '<=', now())->each(function (PR $release) use (&$count) {
            $this->publish($release);
            $count++;
        });

        return $count;
    }

    public function markRefunded(PR $release): void
    {
        if ($release->status === PR::REJECTED) {
            $this->transition($release, PR::REFUNDED, null, 'Payment refunded');
        }
    }

    public function allowed(PR $release, string $to): bool
    {
        return in_array($to, self::TRANSITIONS[$release->status] ?? [], true);
    }

    private function transition(PR $release, string $to, ?int $actorId, ?string $note, bool $internal = false): void
    {
        $this->assertAllowed($release, $to);
        $from = $release->status;
        $release->status = $to;
        $release->save();
        $this->log($release, $from, $to, $actorId, $note, $internal);
    }

    private function assertAllowed(PR $release, string $to): void
    {
        if (!$this->allowed($release, $to)) {
            throw ValidationException::withMessages(['status' => sprintf('Cannot move from %s to %s.', PR::LABELS[$release->status] ?? $release->status, PR::LABELS[$to] ?? $to)]);
        }
    }

    private function log(PR $release, ?string $from, string $to, ?int $actorId, ?string $note, bool $internal = false): void
    {
        $release->events()->create(['from_status' => $from, 'to_status' => $to, 'actor_id' => $actorId, 'note' => $note, 'is_internal' => $internal, 'created_at' => now()]);
        activity('brand_press')->performedOn($release)->causedBy($actorId)->withProperties(['from' => $from, 'to' => $to])->log('press_release.' . $to);
    }

    private function createArticle(PR $release, ?User $editor): int
    {
        $company = $release->company;
        $disclosure = __(config('brand_press.disclosure'), ['company' => e($company->name)]);
        $base = Str::slug($release->title) ?: 'press-release';
        $permalink = $base;
        for ($i = 2; DB::table('tl_blogs')->where('permalink', $permalink)->exists(); $i++) {
            $permalink = $base . '-' . $i;
        }
        $body = $release->body;
        if (!str_contains($body, '<')) {
            $body = collect(preg_split("/\R{2,}/", trim($body)))->map(fn ($p) => '<p>' . nl2br(e($p)) . '</p>')->implode("\n");
        }

        return (int) DB::table('tl_blogs')->insertGetId([
            'name' => $release->title,
            'permalink' => $permalink,
            'user_id' => (int) (config('brand_press.author_user_id') ?: $editor?->id ?: $release->reviewer_id ?: 1),
            'short_description' => $release->summary,
            'content' => clean_press_html($body) . '<p class="cus-press-disclosure"><em>' . e($disclosure) . '</em></p>',
            'visibility' => 'public',
            'is_publish' => (int) config('settings.blog_status.publish'),
            // The theme only shows posts whose publish_at is strictly in the past.
            'publish_at' => now()->subSecond(),
            'formate' => 'standard',
            'meta_title' => Str::limit($release->title, 60, ''),
            'meta_description' => Str::limit((string) $release->summary, 155, ''),
            'reading_time' => max(1, (int) ceil(str_word_count(strip_tags($body)) / 200)) . ' min',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
