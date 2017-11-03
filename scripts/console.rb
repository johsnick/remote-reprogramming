#! /usr/local/bin/ruby

require "dotenv/load"
require "./db/connect"
require "pry"

Dir['./models/*.rb'].each {|file| require file }

pry
