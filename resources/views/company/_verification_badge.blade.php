@php($vs = $company->verification_status)
<span class="cus-badge cus-badge--{{ ['verified' => 'success', 'pending' => 'warning', 'rejected' => 'danger'][$vs] ?? 'info' }}">{{ ['verified' => __('Verified'), 'pending' => __('Verification pending'), 'rejected' => __('Verification rejected')][$vs] ?? __('Unverified') }}</span>
