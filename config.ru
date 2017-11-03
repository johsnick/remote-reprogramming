# This file is used by Rack-based servers to start the application.
require './app'
require 'dotenv/load'
require './db/connect'
run App
