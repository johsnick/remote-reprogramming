# This file is used by Rack-based servers to start the application.
require 'sinatra'

configure do
end

require './app'
run App
