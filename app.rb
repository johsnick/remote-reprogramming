require "sinatra/base"
require "./db/connect"

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

class App < Sinatra::Base
  get "/" do
    send_file 'views/sign_in.html'
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

  post '/users/sign-in' do 
    user = User.first(username: params[:username])
    if user && user.password == params[:password]
      "correct"
    else 
      "wrong"
    end
  end  
end
 