# This file is used by Rack-based servers to start the application.
require 'dotenv/load'
require 'rubygems'
require 'bundler'

Bundler.require

require "./db/connect"

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require "./app"

app = Rack::Builder.new do
  use Rack::Session::Cookie, :secret => ENV['SESSION_SECRET_KEY']

  use Warden::Manager do |manager|
    manager.default_strategies :password
  end

  run App
end

run app