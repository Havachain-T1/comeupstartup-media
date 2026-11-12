# Phase 1.0 — Module-by-module modernisation inventory

Audit of `feature/phase-1-platform-modernisation` (base `feature/phase-0.5-security-stabilisation`).
Stack: Laravel 9.11 / PHP 8.1, MariaDB 10.4, Docker (`docs/DOCKER.md`). 297 registered routes, 70 legacy
tables in `database/data.sql` plus the new Phase 1 tables below.

## Architecture map

| Layer | Location | Notes |
|---|---|---|
| Core CMS (admin) | `Core/` (controllers, models, `Core/Views/base`, `Core/routes/core.php`) | Vendor "CMSLooks" core. Admin theme in `public/backend` (Bootstrap 4, jQuery, DataTables, IcoFont, Themify, MDI, FA6-compatible). |
| Active frontend theme | `themes/newslooks` | Bootstrap 4 + jQuery, Font Awesome 4.7 (`font-awesome.min.css`), `style.css` (192 KB + 436 KB source map shipped publicly). |
| Plugins | `plugins/newslooks-pagebuilder` (active), `plugins/demo-plugin` (active in seed DB) | Demo plugin is vendor sample code; recommend deactivating. |
| New Phase 1 modules | `app/` (Services, Models, Http), `resources/views/{portal,company,brand-press,admin}`, `routes/{company,commerce,brand_press,ai}.php` | Kept outside vendor `Core/` so future vendor updates do not overwrite them. |
| Asset pipeline | `webpack.mix.js` (Laravel Mix) exists but theme/admin assets are committed pre-built; no build step required at runtime. | New CSS/JS is plain, dependency-free files under `public/{css,js}/…`. |

## Module inventory

| Module | Frontend / backend entry points | Findings | Phase 1 action | Status |
|---|---|---|---|---|
| Vendor licence (`themelooks/securelooks`) | middleware, purchase-key screens, `user_keys` | Remote licence check gated the app; phoned home. | Removed package, routes, middleware, views, table (reversible migration). | Done |
| Search | `FrontendBlogController@search`, theme header form | `%LIKE%` over several columns incl. `visibility` (searching "public" matched everything); no index; full reloads only. | `App\Services\Search` (engine interface, FULLTEXT + LIKE fallback, cache, rate limit), `/search-suggest` JSON, debounced UI, benchmark command. | Done (p95 ≈ 49 ms @10k) |
| Social sharing / X | `tl_social_share_options`, theme share partials, theme options, admin icons | Twitter bird in FA4.7/FA6 + SVGs. No native X glyph in bundled libs. | CSS mask + standalone X SVG mapped onto legacy selectors; labels migrated; `twitter` network key and share URLs preserved. | Done |
| Social login | — | No Socialite or social-login code present. | None needed. | n/a |
| Advertising | `CustomAdsController`, `custom_ads`, theme ad widgets | Undated ads silently hidden (`Carbon::parse(null)` path); no state visibility. | Explicit states (live/scheduled/expired/missing_dates/inactive), opt-in `open_ended`, admin badges, regression tests. Undated legacy ads stay hidden. | Done (defect); network/campaign architecture documented as next phase |
| Theme options | `themes/newslooks/resources/views/backend/theme/*` | Bird icon in social options. | X branding CSS loaded. | Done |
| Header / footer / sidebar widgets | theme `frontend/layout/*`, widgets | FA4.7 social icons. | X mask; live search mounted in header. | Done |
| Newsletter | `NewsletterController@store` | Works; no double opt-in. | Unchanged (preserved). | Recommendation |
| Media library | `MediaController` | Works; very large `public/backend` (37 MB) incl. unused plugins. | Unchanged. | Recommendation: prune unused vendor plugins |
| User profiles | `UserController`, `user_profile.blade.php` | Bird icon. | X branding. | Done |
| Article / category / tag management | `BlogController`, `BlogCategoryController`, `TagController` | Works. Unterminated Blade section in menu view leaked output buffers. | Fixed Blade section; untouched otherwise. | Done (defect) |
| Page builder | `plugins/newslooks-pagebuilder` | Works; own `data.sql`. | Unchanged. | Preserved |
| Navigation menus | `MenuController` | See Blade fix above. | — | Done |
| Dashboard widgets | `DashboardController` | Works. | Admin sidebar gains Companies, Brand Press, AI Agents (permission-gated). | Done |
| AI assistant (legacy) | `Core\Http\Controllers\AIAssistantController` | Uses `orhanerday/open-ai`, retired models (`text-davinci-003` etc.), API key stored **plaintext** in `open_ai_settings`. | New central `App\Services\AI` (env-based keys with legacy fallback). Legacy screen left working; migrate it onto `AiService` next. | Partially done |
| Installer | `public/installer` | Ships its own Font Awesome 4 copy; unused after install. | Recommend removal. | Recommendation |
| Company accounts | `routes/company.php` | New. | Implemented with tests. | Done |
| Commerce | `routes/commerce.php` | No prior payment integration found. | Implemented (sandbox + Paystack). | Done |
| Brand Press | `routes/brand_press.php` | New. | Implemented with tests. | Done |
| Expert Network | `app/Models/Expert` | New. | Schema + matcher only (`docs/architecture/expert-network.md`). | Foundation |

## Icon libraries found

| Library | Path | Used by |
|---|---|---|
| Font Awesome 4.7 | `themes/newslooks/public/css/font-awesome.min.css` | Public theme |
| Font Awesome 4 (copy) | `public/installer/fonts/` | Installer only (obsolete) |
| IcoFont | `public/backend/assets/fonts/icofont` | Admin |
| Themify Icons | `public/backend/assets/fonts/themify-icons` | Admin (sparse use) |
| Material Design Icons | `public/backend/assets/css/materialdesignicons.min.css` | Admin (sparse use) |

Four overlapping icon sets ship in the admin/installer. Consolidating them is a separate, visual-regression-heavy task;
Phase 1 only added the X mark without replacing any library.

## Duplicate / obsolete components

- `public/installer` (one-time installer, extra FA copy).
- `plugins/demo-plugin` (vendor sample, active in seed DB).
- `themes/newslooks/public/css/style.css.map` (436 KB source map shipped publicly).
- Multiple jQuery UI copies (`public/backend/assets/plugins/jquery-ui`, `themes/newslooks/public/plugins/jquery-ui`).
- Legacy `AIAssistantController` model list (retired OpenAI completion models).

## Phase 1 database additions

`companies`, `company_members`, `company_invitations`, `company_verifications`, `company_documents`,
`products`, `product_packages`, `orders`, `order_items`, `payments`, `payment_events`, `invoices`, `refunds`,
`press_releases`, `press_release_events`, `ai_prompts`, `ai_requests`, expert network tables (see
`docs/architecture/expert-network.md`), `custom_ads.open_ended`, FULLTEXT indexes on `tl_blogs`; `user_keys` dropped.
Audit history reuses the existing Spatie `activity_log` table.
