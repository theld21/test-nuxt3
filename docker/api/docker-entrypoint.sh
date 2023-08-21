#!/bin/sh
# Exit on fail
set -e
chown -R www-data:www-data /app/storage /app/bootstrap/cache
[ -f /root/.ssh/config ] && chmod 600 /root/.ssh/config
[ -f /root/.ssh/legalscript_dev ] && chmod 400 /root/.ssh/legalscript_dev
crond start
/usr/bin/supervisord
php-fpm

# start supervisor
# Finally call command issued to the docker service
exec "$@"
