/*!
 * ComeUpStartup live search: debounced search-as-you-type with stale-response suppression.
 * SuggestClient is DOM-free (unit tested in tests/js); LiveSearch binds it to an input.
 */
(function (root, factory) {
    var api = factory();
    if (typeof module === 'object' && module.exports) {
        module.exports = api;
    } else {
        root.CusLiveSearch = api;
        if (root.document) {
            root.document.addEventListener('DOMContentLoaded', function () { api.mountAll(root.CUS_SEARCH || {}); });
        }
    }
})(typeof self !== 'undefined' ? self : this, function () {
    'use strict';

    function normalize(text) {
        return String(text || '').replace(/\s+/g, ' ').trim();
    }

    /**
     * Debounces queries, aborts in-flight requests and only reports the response of the latest query.
     * callbacks: onLoading(q), onResults(data, q), onError(kind, q), onIdle()
     */
    function SuggestClient(options, callbacks) {
        this.endpoint = options.endpoint;
        this.minChars = options.minChars || 2;
        this.delay = options.debounce == null ? 300 : options.debounce;
        this.fetchImpl = options.fetch || (typeof fetch !== 'undefined' ? fetch.bind(null) : null);
        this.isOnline = options.isOnline || function () { return typeof navigator === 'undefined' || navigator.onLine !== false; };
        this.cb = callbacks || {};
        this.seq = 0;
        this.timer = null;
        this.controller = null;
        this.cache = new Map();
        this.requests = 0;
    }

    SuggestClient.prototype.input = function (text) {
        var q = normalize(text);
        clearTimeout(this.timer);
        this.seq++;
        if (this.controller) { this.controller.abort(); this.controller = null; }
        if (q.length < this.minChars) {
            this.cb.onIdle && this.cb.onIdle();
            return;
        }
        var key = q.toLowerCase();
        if (this.cache.has(key)) {
            this.cb.onResults && this.cb.onResults(this.cache.get(key), q);
            return;
        }
        this.cb.onLoading && this.cb.onLoading(q);
        var self = this, seq = this.seq;
        this.timer = setTimeout(function () { self._request(q, key, seq); }, this.delay);
    };

    SuggestClient.prototype._request = function (q, key, seq) {
        var self = this;
        if (!this.isOnline()) {
            this.cb.onError && this.cb.onError('offline', q);
            return;
        }
        var controller = typeof AbortController !== 'undefined' ? new AbortController() : null;
        this.controller = controller;
        this.requests++;
        var url = this.endpoint + (this.endpoint.indexOf('?') === -1 ? '?' : '&') + 'q=' + encodeURIComponent(q);
        this.fetchImpl(url, { headers: { Accept: 'application/json' }, signal: controller ? controller.signal : undefined })
            .then(function (res) {
                if (!res.ok) { var e = new Error('HTTP ' + res.status); e.status = res.status; throw e; }
                return res.json();
            })
            .then(function (data) {
                if (seq !== self.seq) { return; }
                self.cache.set(key, data);
                if (self.cache.size > 50) { self.cache.delete(self.cache.keys().next().value); }
                self.controller = null;
                self.cb.onResults && self.cb.onResults(data, q);
            })
            .catch(function (err) {
                if (seq !== self.seq || (err && err.name === 'AbortError')) { return; }
                self.controller = null;
                var kind = err && err.status === 429 ? 'rate_limited' : (!self.isOnline() ? 'offline' : 'error');
                self.cb.onError && self.cb.onError(kind, q);
            });
    };

    SuggestClient.prototype.cancel = function () {
        clearTimeout(this.timer);
        this.seq++;
        if (this.controller) { this.controller.abort(); this.controller = null; }
    };

    var uid = 0;

    function el(tag, cls, text) {
        var n = document.createElement(tag);
        if (cls) { n.className = cls; }
        if (text != null) { n.textContent = text; }
        return n;
    }

    function LiveSearch(input, config) {
        var labels = config.labels || {};
        this.input = input;
        this.config = config;
        this.labels = labels;
        this.active = -1;
        this.options = [];
        this.id = 'cus-search-' + (++uid);
        var group = input.parentNode;
        group.classList.add('cus-search');

        this.panel = el('div', 'cus-search__panel');
        this.panel.id = this.id + '-panel';
        this.panel.hidden = true;
        this.list = el('div', 'cus-search__results');
        this.list.id = this.id + '-list';
        this.list.setAttribute('role', 'listbox');
        this.status = el('div', 'cus-search__status');
        this.status.setAttribute('role', 'status');
        this.status.setAttribute('aria-live', 'polite');
        this.panel.appendChild(this.status);
        this.panel.appendChild(this.list);
        group.appendChild(this.panel);

        this.clearBtn = el('button', 'cus-search__clear');
        this.clearBtn.type = 'button';
        this.clearBtn.hidden = !input.value;
        this.clearBtn.setAttribute('aria-label', labels.clear || 'Clear search');
        this.clearBtn.innerHTML = '&times;';
        group.insertBefore(this.clearBtn, input.nextSibling);

        input.setAttribute('role', 'combobox');
        input.setAttribute('autocomplete', 'off');
        input.setAttribute('aria-autocomplete', 'list');
        input.setAttribute('aria-expanded', 'false');
        input.setAttribute('aria-controls', this.list.id);
        if (!input.getAttribute('aria-label')) { input.setAttribute('aria-label', labels.placeholder || 'Search'); }

        var self = this;
        this.client = new SuggestClient({ endpoint: config.endpoint, minChars: config.minChars, debounce: config.debounce }, {
            onLoading: function () { self.showStatus(labels.loading || 'Searching…', 'loading'); },
            onResults: function (data) { self.render(data); },
            onError: function (kind) {
                var msg = kind === 'offline' ? (labels.offline || 'You appear to be offline.')
                    : kind === 'rate_limited' ? (labels.rateLimited || 'Too many searches, please wait a moment.')
                    : (labels.error || 'Search is unavailable right now. Press Enter to search.');
                self.showStatus(msg, 'error');
            },
            onIdle: function () { self.close(); }
        });

        input.addEventListener('input', function () {
            self.clearBtn.hidden = !input.value;
            self.client.input(input.value);
        });
        input.addEventListener('keydown', function (e) { self.onKeydown(e); });
        input.addEventListener('focus', function () {
            if (self.options.length && normalize(input.value).length >= self.client.minChars) { self.open(); }
        });
        this.clearBtn.addEventListener('click', function () {
            input.value = '';
            self.clearBtn.hidden = true;
            self.client.cancel();
            self.close();
            input.focus();
        });
        document.addEventListener('click', function (e) {
            if (!group.contains(e.target)) { self.close(); }
        });
    }

    LiveSearch.prototype.onKeydown = function (e) {
        var open = !this.panel.hidden;
        if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
            if (!this.options.length) { return; }
            e.preventDefault();
            if (!open) { this.open(); }
            var n = this.options.length;
            this.setActive(e.key === 'ArrowDown' ? (this.active + 1) % n : (this.active - 1 + n) % n);
        } else if (e.key === 'Enter') {
            if (open && this.active >= 0 && this.options[this.active]) {
                e.preventDefault();
                e.stopPropagation();
                window.location.href = this.options[this.active].href;
            }
        } else if (e.key === 'Escape') {
            if (open) {
                e.preventDefault();
                e.stopPropagation();
                this.client.cancel();
                this.close();
            }
        }
    };

    LiveSearch.prototype.setActive = function (i) {
        if (this.options[this.active]) { this.options[this.active].setAttribute('aria-selected', 'false'); }
        this.active = i;
        var opt = this.options[i];
        if (opt) {
            opt.setAttribute('aria-selected', 'true');
            this.input.setAttribute('aria-activedescendant', opt.id);
            if (opt.scrollIntoView) { opt.scrollIntoView({ block: 'nearest' }); }
        } else {
            this.input.removeAttribute('aria-activedescendant');
        }
    };

    LiveSearch.prototype.showStatus = function (msg, state) {
        this.status.textContent = msg;
        this.panel.setAttribute('data-state', state);
        this.list.innerHTML = '';
        this.options = [];
        this.setActive(-1);
        this.open();
    };

    LiveSearch.prototype.render = function (data) {
        var labels = this.labels, self = this;
        var groupLabels = { articles: labels.articles || 'Articles', categories: labels.categories || 'Categories', authors: labels.authors || 'Authors', companies: labels.companies || 'Companies' };
        this.list.innerHTML = '';
        this.options = [];
        this.setActive(-1);
        if (!data.total) {
            this.status.textContent = (labels.empty || 'No results for') + ' “' + data.query + '”';
            this.panel.setAttribute('data-state', 'empty');
        } else {
            this.status.textContent = data.total + ' ' + (labels.results || 'suggestions');
            this.panel.setAttribute('data-state', 'results');
            (data.groups || []).forEach(function (group) {
                var section = el('div', 'cus-search__group');
                section.setAttribute('role', 'group');
                var heading = el('div', 'cus-search__group-title', groupLabels[group.type] || group.type);
                heading.id = self.id + '-g-' + group.type;
                section.setAttribute('aria-labelledby', heading.id);
                section.appendChild(heading);
                group.items.forEach(function (item) {
                    var a = el('a', 'cus-search__option cus-search__option--' + group.type);
                    a.href = item.url;
                    a.id = self.id + '-opt-' + self.options.length;
                    a.setAttribute('role', 'option');
                    a.setAttribute('aria-selected', 'false');
                    a.tabIndex = -1;
                    a.appendChild(el('span', 'cus-search__title', item.title));
                    var meta = [item.category, item.date].filter(Boolean).join(' · ');
                    if (meta) { a.appendChild(el('span', 'cus-search__meta', meta)); }
                    if (item.excerpt) { a.appendChild(el('span', 'cus-search__excerpt', item.excerpt)); }
                    section.appendChild(a);
                    self.options.push(a);
                });
                self.list.appendChild(section);
            });
        }
        if (data.search_url) {
            var all = el('a', 'cus-search__all', (labels.viewAll || 'See all results for') + ' “' + data.query + '”');
            all.href = data.search_url;
            all.id = this.id + '-opt-' + this.options.length;
            all.setAttribute('role', 'option');
            all.setAttribute('aria-selected', 'false');
            all.tabIndex = -1;
            this.list.appendChild(all);
            this.options.push(all);
        }
        this.open();
    };

    LiveSearch.prototype.open = function () {
        this.panel.hidden = false;
        this.input.setAttribute('aria-expanded', 'true');
    };

    LiveSearch.prototype.close = function () {
        this.panel.hidden = true;
        this.input.setAttribute('aria-expanded', 'false');
        this.setActive(-1);
    };

    function mountAll(config) {
        if (!config.endpoint) { return []; }
        var inputs = document.querySelectorAll('form.header-search-form input.search-text');
        return Array.prototype.map.call(inputs, function (input) {
            if (input.getAttribute('data-live-search') === 'on') { return null; }
            input.setAttribute('data-live-search', 'on');
            return new LiveSearch(input, config);
        });
    }

    return { SuggestClient: SuggestClient, LiveSearch: LiveSearch, mountAll: mountAll, normalize: normalize };
});
