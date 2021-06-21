#!/usr/bin/env sh
set -eu

envsubst '${APP_NAME}' < /etc/nginx/conf.d/xtages.conf.template > /etc/nginx/conf.d/xtages.conf
envsubst '${ORGANIZATION_HASH} ${APP_NAME} ${APP_ENV}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec "$@"
