class App < Sinatra::Base
  get "/" do
    if current_user
       redirect '/radios'
    else
      rend :sign_in
    end
  end

  post '/radios/register-ip' do 
    auth

    radio = Radio.first(name: params[:name])
    if radio.nil?
      radio = Radio.new
      radio.name = params[:name]
    end
    radio.ip = params[:ip]
    radio.save
  end

  post '/radios/:id/reprogram' do |id|
    auth 
    radio = Radio[id]
    # reprogram radio here
   end

  post '/radios/reprogram-batch' do
    auth 
    params[:radio_ids].asdf
  end

  get '/radios' do
    auth 
    @radios = Radio.all
    @software = Software.select(:id, :name, :details)
    rend :radios
  end

  post '/users/sign-in' do 
    warden.authenticate
    redirect '/'
  end  

  get '/users/sign-out' do 
    auth 
    warden.logout
    redirect '/'
  end

  post '/software' do 
    auth 
    soft = Software.first(name: params[:name])
    unless soft
      soft = Software.new
      soft.name = params[:name]
    end

    soft.filename = params[:file][:filename]
    soft.details = params[:details]

    begin 
      soft.save
    rescue => e
      e.to_s
    end

    %x( mkdir software )
    f = open("software/#{soft.filename}", 'w')
    f.write(params[:file][:tempfile].read)
    f.close

    redirect '/radios'
  end

  get '/software' do 
    auth 
    rend :software
  end
end
 