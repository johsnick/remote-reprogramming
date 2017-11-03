require "sinatra/base"
require "./db/connect"

class App < Sinatra::Base
  get "/" do
    "<p>hello world</p>"
  end

  post '/radios/register-ip' do 
    radio = Radio.first(name: params[:name])
    if radio.nil?
      radio = Radio.new
      radio.name = params[:name]
    end
    radio.ip = params[:ip]
    radio.save
  end

  post '/radios/:id/reprogram' do |id|
    radio = Radio[id]
    # reprogram radio here
   end
end
 