#! /bin/bash

bundle check || bundle install
./scripts/migrats.rb
rackup --host 0.0.0.0 -p 5000