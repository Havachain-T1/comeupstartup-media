@extends('core::base.layouts.master')
@section('title') {{ translate('AI editorial agents') }} @endsection
@section('custom_css') <link rel="stylesheet" href="{{ asset('public/css/portal/portal.css') }}"> @endsection
@section('main_content')
    <div class="cus-portal" style="padding-top:0">
        <div class="cus-page-head"><div><h1>{{ translate('AI editorial agents') }}</h1>
            <p>{{ translate('Agents produce drafts only. Nothing is published without an editor reviewing, editing and approving it.') }}</p></div></div>
        @unless ($available)<div class="cus-alert cus-alert--warning">{{ translate('AI provider is not configured. Set AI_PROVIDER and the provider key in the environment.') }}</div>@endunless
        <div class="cus-grid">
            <div class="cus-card cus-stat"><div class="cus-stat__label">{{ translate('Provider') }}</div><div class="cus-stat__value" style="font-size:1rem">{{ $provider }}</div></div>
            <div class="cus-card cus-stat"><div class="cus-stat__label">{{ translate('Requests (30 days)') }}</div><div class="cus-stat__value">{{ number_format($usage->requests ?? 0) }}</div></div>
            <div class="cus-card cus-stat"><div class="cus-stat__label">{{ translate('Tokens (30 days)') }}</div><div class="cus-stat__value">{{ number_format($usage->tokens ?? 0) }}</div></div>
            <div class="cus-card cus-stat"><div class="cus-stat__label">{{ translate('Estimated cost') }}</div><div class="cus-stat__value">${{ number_format(($usage->cost_micros ?? 0) / 1000000, 2) }}</div></div>
        </div>
        <form class="cus-card" id="cus-agent-form"><div class="cus-card__body cus-form">
            <div class="cus-field"><label for="agent">{{ translate('Agent') }}</label><select class="cus-input" id="agent">
                @foreach ($agents as $agent)<option value="{{ route('admin.ai.agents.run', $agent->value) }}">{{ $agent->label() }}</option>@endforeach</select></div>
            <div class="cus-field"><label for="brief">{{ translate('Brief or text') }}</label><textarea class="cus-input" id="brief" required minlength="10" style="min-height:6rem"></textarea></div>
            <div class="cus-field"><label for="sources">{{ translate('Source material') }}</label><textarea class="cus-input" id="sources" style="min-height:6rem"></textarea></div>
            <div class="cus-actions"><button class="cus-btn cus-btn--primary" type="submit" @disabled(!$available)>{{ translate('Generate draft') }}</button></div>
            <div id="agent_status" role="status" aria-live="polite" class="cus-hint"></div>
            <div class="cus-field"><label for="output">{{ translate('Draft (requires editorial review)') }}</label><textarea class="cus-input" id="output" readonly style="min-height:12rem"></textarea></div>
        </div></form>
    </div>
    <script>
    document.getElementById('cus-agent-form').addEventListener('submit', function (e) {
        e.preventDefault();
        var s = document.getElementById('agent_status'), btn = this.querySelector('button'); btn.disabled = true; s.textContent = @json(translate('Generating…'));
        fetch(document.getElementById('agent').value, { method: 'POST', headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
            body: JSON.stringify({ brief: document.getElementById('brief').value, sources: document.getElementById('sources').value }) })
            .then(function (r) { return r.json().then(function (j) { return { ok: r.ok, j: j }; }); })
            .then(function (res) { if (!res.ok) throw new Error(res.j.message || 'Error'); document.getElementById('output').value = res.j.text; s.textContent = res.j.prompt; })
            .catch(function (err) { s.textContent = err.message; }).finally(function () { btn.disabled = false; });
    });
    </script>
@endsection
