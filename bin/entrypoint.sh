#!/usr/bin/env bash

echo "Clearing pids"
rm --r tmp/pids

bundle exec rails s -b 0.0.0.0 -p 3000
