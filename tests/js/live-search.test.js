// Run: docker run --rm -v "$PWD":/app -w /app node:16-alpine node tests/js/live-search.test.js
const assert = require('assert');
const { SuggestClient, normalize } = require('../../public/js/search/live-search.js');

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

function fakeFetch(delays, calls) {
    return (url, opts) => new Promise((resolve, reject) => {
        const q = decodeURIComponent(url.split('q=')[1]);
        calls.push(q);
        const t = setTimeout(() => resolve({ ok: true, status: 200, json: async () => ({ query: q, total: 1, groups: [] }) }), delays[q] || 10);
        if (opts.signal) {
            opts.signal.addEventListener('abort', () => { clearTimeout(t); const e = new Error('aborted'); e.name = 'AbortError'; reject(e); });
        }
    });
}

const tests = {
    async 'debounces keystrokes into a single request'() {
        const calls = [], results = [];
        const c = new SuggestClient({ endpoint: '/s', debounce: 50, fetch: fakeFetch({}, calls) }, { onResults: (d) => results.push(d.query) });
        for (const q of ['s', 'st', 'sta', 'star', 'start']) { c.input(q); await sleep(10); }
        await sleep(120);
        assert.deepStrictEqual(calls, ['start']);
        assert.deepStrictEqual(results, ['start']);
    },
    async 'ignores queries below the minimum length'() {
        const calls = []; let idle = 0;
        const c = new SuggestClient({ endpoint: '/s', debounce: 5, minChars: 2, fetch: fakeFetch({}, calls) }, { onIdle: () => idle++ });
        c.input(' a '); await sleep(30);
        assert.deepStrictEqual(calls, []);
        assert.strictEqual(idle, 1);
    },
    async 'shows loading immediately before the debounce elapses'() {
        let loading = 0;
        const c = new SuggestClient({ endpoint: '/s', debounce: 200, fetch: fakeFetch({}, []) }, { onLoading: () => loading++ });
        c.input('fintech');
        assert.strictEqual(loading, 1);
        c.cancel();
    },
    async 'a slow older response never overwrites a newer one'() {
        const calls = [], results = [];
        const c = new SuggestClient({ endpoint: '/s', debounce: 0, fetch: fakeFetch({ fin: 150, fintech: 10 }, calls) }, { onResults: (d) => results.push(d.query) });
        c.input('fin'); await sleep(20);
        c.input('fintech'); await sleep(250);
        assert.deepStrictEqual(calls, ['fin', 'fintech']);
        assert.deepStrictEqual(results, ['fintech']);
    },
    async 'stale responses are suppressed even when abort is unsupported'() {
        const results = [];
        const slowFirst = (url) => { const q = decodeURIComponent(url.split('q=')[1]); return sleep(q === 'old' ? 100 : 5).then(() => ({ ok: true, json: async () => ({ query: q, total: 0, groups: [] }) })); };
        const c = new SuggestClient({ endpoint: '/s', debounce: 0, fetch: slowFirst }, { onResults: (d) => results.push(d.query) });
        c.input('old'); await sleep(10); c.input('new'); await sleep(150);
        assert.deepStrictEqual(results, ['new']);
    },
    async 'repeated queries are served from the client cache'() {
        const calls = [], results = [];
        const c = new SuggestClient({ endpoint: '/s', debounce: 0, fetch: fakeFetch({}, calls) }, { onResults: (d) => results.push(d.query) });
        c.input('ai'); await sleep(30); c.input('a'); c.input('ai'); await sleep(30);
        assert.deepStrictEqual(calls, ['ai']);
        assert.deepStrictEqual(results, ['ai', 'ai']);
    },
    async 'reports network errors, offline state and rate limiting'() {
        const errors = [];
        const failing = () => Promise.reject(new TypeError('Failed to fetch'));
        const c1 = new SuggestClient({ endpoint: '/s', debounce: 0, fetch: failing }, { onError: (k) => errors.push(k) });
        c1.input('xyz'); await sleep(20);
        const c2 = new SuggestClient({ endpoint: '/s', debounce: 0, fetch: failing, isOnline: () => false }, { onError: (k) => errors.push(k) });
        c2.input('xyz'); await sleep(20);
        const limited = () => Promise.resolve({ ok: false, status: 429 });
        const c3 = new SuggestClient({ endpoint: '/s', debounce: 0, fetch: limited }, { onError: (k) => errors.push(k) });
        c3.input('xyz'); await sleep(20);
        assert.deepStrictEqual(errors, ['error', 'offline', 'rate_limited']);
    },
    async 'normalizes whitespace and encodes the query'() {
        const urls = [];
        const c = new SuggestClient({ endpoint: '/s?lang=en', debounce: 0, fetch: (u) => { urls.push(u); return new Promise(() => {}); } }, {});
        c.input('  rust &  go  '); await sleep(10);
        assert.strictEqual(normalize('  a   b '), 'a b');
        assert.deepStrictEqual(urls, ['/s?lang=en&q=rust%20%26%20go']);
    },
};

(async () => {
    let failed = 0;
    for (const [name, fn] of Object.entries(tests)) {
        try { await fn(); console.log('  ok  ' + name); } catch (e) { failed++; console.log('  FAIL ' + name + '\n    ' + e.message); }
    }
    console.log(`\n${Object.keys(tests).length - failed} passed, ${failed} failed`);
    process.exit(failed ? 1 : 0);
})();
