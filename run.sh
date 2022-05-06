#!/usr/bin/env sh

set -e
set -x
set -v

node create-config.js
nohup node current/index.js &
sleep 15
netstat -antp
