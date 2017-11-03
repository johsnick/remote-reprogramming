#! /usr/local/bin/ruby

require 'dotenv/load'
require './db/connect'

Sequel.extension :migration
Sequel::Migrator.run(DB, "db/migrations")