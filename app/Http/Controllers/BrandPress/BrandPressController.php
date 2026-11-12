<?php

namespace App\Http\Controllers\BrandPress;

use App\Http\Controllers\Controller;
use App\Models\BrandPress\PressRelease;
use App\Models\Commerce\Product;
use App\Models\Company\Company;
use App\Services\BrandPress\BrandPressWorkflow;
use Illuminate\Http\Request;

class BrandPressController extends Controller
{
    private const RULES = [
        'title' => 'required|string|min:10|max:225',
        'summary' => 'nullable|string|max:500',
        'body' => 'required|string|min:200|max:30000',
        'contact_name' => 'nullable|string|max:191',
        'contact_email' => 'nullable|email|max:191',
        'ai_assisted' => 'nullable|boolean',
    ];

    public function index(Request $request, Company $company)
    {
        $releases = PressRelease::with('blog:id,views,permalink')->where('company_id', $company->id)
            ->when($request->query('status'), fn ($q, $s) => $q->where('status', $s))->latest('id')->paginate(15)->withQueryString();

        return view('brand-press.index', ['company' => $company, 'releases' => $releases, 'member' => $request->attributes->get('companyMember')]);
    }

    public function create(Company $company)
    {
        return view('brand-press.form', ['company' => $company, 'release' => new PressRelease()]);
    }

    public function store(Request $request, Company $company, BrandPressWorkflow $workflow)
    {
        $release = $workflow->createDraft($request->attributes->get('companyMember'), $request->validate(self::RULES));

        return redirect()->route('brand-press.show', [$company, $release])->with('status', __('Draft saved. Choose a package to submit it for review.'));
    }

    public function show(Request $request, Company $company, PressRelease $release)
    {
        $release = $this->scoped($company, $release)->load(['events' => fn ($q) => $q->where('is_internal', false), 'events.actor:id,name', 'order', 'package', 'blog:id,views,permalink']);
        $packages = Product::where('code', config('brand_press.product_code'))->first()?->packages()->active()->get() ?? collect();

        return view('brand-press.show', ['company' => $company, 'release' => $release, 'packages' => $packages, 'member' => $request->attributes->get('companyMember')]);
    }

    public function edit(Company $company, PressRelease $release)
    {
        $release = $this->scoped($company, $release);
        abort_unless($release->isEditableByCompany(), 403, __('This announcement can no longer be edited.'));

        return view('brand-press.form', compact('company', 'release'));
    }

    public function update(Request $request, Company $company, PressRelease $release, BrandPressWorkflow $workflow)
    {
        $workflow->update($this->scoped($company, $release), $request->validate(self::RULES));

        return redirect()->route('brand-press.show', [$company, $release])->with('status', __('Changes saved.'));
    }

    public function submit(Request $request, Company $company, PressRelease $release, BrandPressWorkflow $workflow)
    {
        $release = $this->scoped($company, $release);
        $member = $request->attributes->get('companyMember');

        if ($release->status === PressRelease::CHANGES_REQUESTED) {
            $workflow->resubmit($release, $member, $request->input('note'));

            return back()->with('status', __('Resubmitted for editorial review.'));
        }

        $request->validate(['package_id' => 'required|integer']);
        $product = Product::where('code', config('brand_press.product_code'))->firstOrFail();
        $package = $product->packages()->active()->findOrFail($request->integer('package_id'));
        $release = $workflow->submit($release, $member, $package);

        return redirect()->route('company.orders.show', [$company, $release->order])->with('status', __('Submitted. Complete payment to send it to our editors.'));
    }

    private function scoped(Company $company, PressRelease $release): PressRelease
    {
        abort_unless((int) $release->company_id === (int) $company->id, 404);

        return $release;
    }
}
