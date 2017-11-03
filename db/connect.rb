require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }