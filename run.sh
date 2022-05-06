#!/usr/bin/env sh

set -e
set -x
set -v

node create-config.js
export DEBUG=ghost:*,ghost-config
nohup node current/index.js &
sleep 15
netstat -antp

curl -D - -H "X-Forwarded-Proto: https" http://localhost:$PORT
