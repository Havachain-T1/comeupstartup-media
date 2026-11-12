# Local development environment (Docker)

Development and staging only. Never point this environment at production databases,
production credentials or production uploads, and never deploy these images to production.

## Stack

| Service | Image | Purpose |
|---|---|---|
| `app` | `comeupstartup-media-app:dev` (built from `Dockerfile`, `php:8.1-apache`) | PHP 8.1 + Apache + Composer 2.8, extensions `pdo_mysql gd zip exif bcmath intl` |
| `db` | `mariadb:10.4` | Imports `database/data.sql` (sanitised demo seed) into `comeupstartup` and `comeupstartup_test` on first start |
| `node` (profile `assets`) | `node:16-bullseye-slim` | Laravel Mix 6 toolchain. The compiled theme/admin assets are committed; the root `webpack.mix.js` defines no build tasks and the `themes/<theme>/webpack.mix.js` it loads for `--theme=<theme>` is not in the repository, so this service currently compiles nothing |

## First run

```bash
cp .env.example .env
# Edit .env: set DB_PASSWORD and DB_ROOT_PASSWORD to any local-only values.
docker compose up -d --build
docker compose exec app php artisan key:generate
docker compose exec app php artisan jwt:secret --force
```

The site is served on `http://localhost:${APP_PORT:-8080}` (bound to 127.0.0.1 only, because the seed's demo accounts use the password `password`). The first `app` start runs
`composer install` if `vendor/` is missing; the first `db` start imports the seed
(watch `docker compose logs -f db`).

Demo logins come from the sanitised seed: e.g. `admin@example.com` / `password`.
Some admin pages (dashboard, widgets, menus, themes, plugins) are gated by the vendor
ThemeLooks licence middleware and redirect to licence activation on an unlicensed copy.
Leave `LICENSE_CHECKED` empty locally so the app never calls the vendor licence API.

## Everyday commands

```bash
docker compose up -d                 # start
docker compose stop                  # stop (keeps database volume)
docker compose down                  # remove containers (keeps database volume)
docker compose up -d --build         # rebuild the app image after Dockerfile changes
docker compose exec app php artisan route:list
docker compose exec app php artisan test        # smoke tests (uses comeupstartup_test)
docker compose --profile assets run --rm node   # Mix toolchain (no build tasks defined yet, see above)
```

## Re-importing the database

The seed is imported only when the database volume is empty. To start from a clean seed:

```bash
docker compose down -v               # deletes the local database volume only
docker compose up -d
```

`database/data.sql` is a sanitised development seed (see its header). If the seed is ever
regenerated from another dump, run `python3 tools/sanitise-seed.py database/data.sql`
before committing, and never commit an unsanitised dump.
