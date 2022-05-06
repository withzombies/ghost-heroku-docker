#!/usr/bin/env sh

set -v

node create-config.js
export DEBUG=ghost:*,ghost-config
cp config.production.json $GHOST_INSTALL/current/config.production.json
node current/index.js
