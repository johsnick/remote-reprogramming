class App < Sinatra::Base
  get "/" do
    if current_user
       redirect '/radios'
    else
      rend :sign_in
    end
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

  post '/radios/reprogram-batch' do
    params[:radio_ids]
  end

  get '/radios' do
    @radios = Radio.all
    rend :radios
  end

  post '/users/sign-in' do 
    warden.authenticate
    redirect '/'
  end  

  get '/users/sign-out' do 
    warden.logout
    redirect '/'
  end

  post '/software' do 
    software = Software.new
    software.filename = params[:filename]
    software.name = params[:name]
    software.description = params[:description]
    software.save
  end
  
  begin  
  rescue => e
      e
  end
end
 