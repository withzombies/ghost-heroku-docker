#!/usr/bin/env sh

set -e
set -x
set -v

node create-config.js
export DEBUG=ghost:*,ghost-config
cp current/MigratorConfig.js .
yarn --cwd current/ run knex-migrator init --mgpath .
node current/index.js
