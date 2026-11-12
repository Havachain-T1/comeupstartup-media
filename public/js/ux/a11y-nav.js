/* Progressive accessibility layer for the legacy theme's off-canvas panels and dropdowns:
   dialog semantics, aria-expanded sync, Escape to close, focus moved in and restored on close. */
(function () {
    'use strict';
    var FOCUSABLE = 'a[href], button:not([disabled]), input:not([disabled]), select, textarea, [tabindex]:not([tabindex="-1"])';
    var lastTrigger = null;

    function triggersFor(panel) {
        return document.querySelectorAll('[data-toggle="offCanvas"][data-target="' + panel.id + '"]');
    }

    function sync(panel) {
        var open = panel.classList.contains('open');
        triggersFor(panel).forEach(function (t) { t.setAttribute('aria-expanded', open ? 'true' : 'false'); });
        panel.setAttribute('aria-hidden', open ? 'false' : 'true');
        if (open) {
            var first = panel.querySelector('.close-offcanvas') || panel.querySelector(FOCUSABLE);
            if (first && !panel.contains(document.activeElement)) first.focus({ preventScroll: true });
        } else if (lastTrigger && panel.contains(document.activeElement)) {
            lastTrigger.focus({ preventScroll: true });
        }
    }

    function init() {
        document.querySelectorAll('.offcanvas[id]').forEach(function (panel) {
            panel.setAttribute('role', 'dialog');
            panel.setAttribute('aria-modal', 'true');
            if (!panel.hasAttribute('aria-label')) panel.setAttribute('aria-label', panel.id === 'offcanvasMenu' ? 'Menu' : 'Panel');
            triggersFor(panel).forEach(function (t) {
                t.setAttribute('aria-controls', panel.id);
                t.addEventListener('click', function () { lastTrigger = t; });
            });
            new MutationObserver(function () { sync(panel); }).observe(panel, { attributes: true, attributeFilter: ['class'] });
            sync(panel);
        });

        document.querySelectorAll('.close-offcanvas:not([aria-label])').forEach(function (b) { b.setAttribute('aria-label', 'Close'); b.type = 'button'; });

        document.addEventListener('keydown', function (e) {
            if (e.key !== 'Escape') return;
            var open = document.querySelector('.offcanvas.open');
            if (!open) return;
            var close = open.querySelector('.close-offcanvas');
            if (close) close.click(); else open.click();
        });

        // Submenu toggles injected by main.js are bare <span>s; make them keyboard-operable buttons.
        setTimeout(function () {
            document.querySelectorAll('.submenu-button').forEach(function (s) {
                s.setAttribute('role', 'button');
                s.setAttribute('tabindex', '0');
                s.setAttribute('aria-label', 'Toggle submenu');
                s.setAttribute('aria-expanded', s.classList.contains('open') ? 'true' : 'false');
                s.addEventListener('click', function () { setTimeout(function () { s.setAttribute('aria-expanded', s.classList.contains('open') ? 'true' : 'false'); }); });
                s.addEventListener('keydown', function (e) { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); s.click(); } });
            });
        }, 0);
    }

    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
