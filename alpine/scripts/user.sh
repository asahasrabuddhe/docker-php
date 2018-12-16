#!/bin/sh
set -ex

# ensure www-data user exists
# 82 is the standard uid/gid for "www-data" in Alpine
addgroup -g 82 -S www-data
adduser -u 82 -D -S -G www-data www-data