@if (app(\App\Services\AI\AiService::class)->available())
    <details class="cus-card" id="cus-ai-assist" data-endpoint="{{ route('brand-press.ai-assist', $company) }}" style="padding:0 1rem">
        <summary style="padding:.75rem 0;cursor:pointer;font-weight:600">{{ __('Draft with AI writing assistance') }}</summary>
        <div class="cus-form" style="padding-bottom:1rem">
            <div class="cus-field"><label for="ai_notes">{{ __('Your notes (facts, figures, quotes)') }}</label>
                <textarea class="cus-input" id="ai_notes" style="min-height:6rem" maxlength="8000"></textarea>
                <div class="cus-hint">{{ __('AI drafts can contain mistakes. Check every fact before saving. Our editors review all announcements.') }}</div></div>
            <div class="cus-actions"><select class="cus-input" id="ai_tone" aria-label="{{ __('Tone') }}" style="width:auto"><option value="neutral">{{ __('Neutral') }}</option><option value="confident">{{ __('Confident') }}</option><option value="formal">{{ __('Formal') }}</option></select>
                <button type="button" class="cus-btn cus-btn--secondary" id="ai_go">{{ __('Generate draft') }}</button></div>
            <div id="ai_status" role="status" aria-live="polite" class="cus-hint"></div>
        </div>
    </details>
    <script>
    (function () {
        var box = document.getElementById('cus-ai-assist'), btn = document.getElementById('ai_go'), status = document.getElementById('ai_status');
        btn.addEventListener('click', function () {
            var notes = document.getElementById('ai_notes').value.trim();
            if (notes.length < 30) { status.textContent = @json(__('Add at least 30 characters of notes.')); return; }
            var body = document.getElementById('body');
            if (body.value.trim() && !confirm(@json(__('Replace the current announcement text with the AI draft?')))) return;
            btn.disabled = true; status.textContent = @json(__('Generating…'));
            fetch(box.dataset.endpoint, { method: 'POST', headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', 'X-CSRF-TOKEN': document.querySelector('input[name=_token]').value },
                body: JSON.stringify({ notes: notes, title: document.getElementById('title').value, tone: document.getElementById('ai_tone').value }) })
                .then(function (r) { return r.json().then(function (j) { return { ok: r.ok, j: j }; }); })
                .then(function (res) {
                    if (!res.ok) throw new Error(res.j.message || (res.j.errors && Object.values(res.j.errors)[0][0]) || 'Error');
                    body.value = res.j.text; document.getElementById('ai_assisted').value = 1;
                    status.textContent = @json(__('Draft inserted. Review and edit it before saving.'));
                })
                .catch(function (e) { status.textContent = e.message === 'Failed to fetch' ? @json(__('Network error. Check your connection and try again.')) : e.message; })
                .finally(function () { btn.disabled = false; });
        });
    })();
    </script>
@endif
