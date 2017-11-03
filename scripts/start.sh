#! /bin/bash
set -e
bundle check || bundle install
./scripts/migrate.rb
rackup --host 0.0.0.0 -p 5000