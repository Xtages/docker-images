#!/usr/bin/env sh
set -eu

envsubst '${APP_NAME}' < /etc/nginx/conf.d/xtages.conf.template > /etc/nginx/conf.d/xtages.conf

exec "$@"
