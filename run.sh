#!/usr/bin/env sh

set -e
set -x
set -v

node create-config.js
export DEBUG=ghost:*,ghost-config
cp config.production.json $GHOST_INSTALL/current/config.production.json
yarn --cwd current/ run knex-migrator init --mgpath $GHOST_INSTALL/current || yarn --cwd current/ run knex-migrator migrate --mgpath $GHOST_INSTALL/current
node current/index.js
