#! /bin/bash

bundle check || bundle install

rackup --host 0.0.0.0 -p 5000