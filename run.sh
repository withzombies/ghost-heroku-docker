#!/usr/bin/env sh

set -e
set -x
set -v

node create-config.js
node current/index.js &
netstat -antp
fg
