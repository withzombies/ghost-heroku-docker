#!/usr/bin/env sh

set -e
set -x
set -v

node create-config.js
export DEBUG=ghost:*,ghost-config
yarn --cwd current/ run knex-migrator init
node current/index.js
