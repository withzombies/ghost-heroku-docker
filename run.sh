#!/usr/bin/env sh

set -e
set -x
set -v

node create-config.js
export DEBUG=ghost:*,ghost-config
node current/index.js
