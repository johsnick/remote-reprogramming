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
    warden.authenticate

    "success"
  end  

  get '/test' do 
    current_user.username
  end
end
 