#!/bin/sh
set -e
cd /var/www/html

mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/views \
         storage/logs storage/app/public bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache 2>/dev/null || true

if [ ! -f vendor/autoload.php ]; then
    echo "vendor/ missing - running composer install"
    composer install --no-interaction --prefer-dist
    chown -R www-data:www-data vendor 2>/dev/null || true
fi

exec "$@"
