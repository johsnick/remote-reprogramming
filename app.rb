class App < Sinatra::Base

  require_relative 'lib/rrpg/rrpg'

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
    # probably won't need to use this
    # if we do want this, do as below.
    # or get James to make it do as below.
    auth
    radio = Radio[id]
    rrpg = RRPG.new
    rrpg.reprogram(radio.id)
    # reprogram radio here
   end

  post '/radios/reprogram-batch' do
    begin 
      auth
      radios = Radio.where(id: params[:radio_ids])
      software = Software.where(name: params[:software_version]).first
      radios.each {|r| r.update(software_id: software.id) }

      # actually reprogram the radios here
      RRPG.reprogram_batch(radios, software)

      # rend :none
      return 200

    rescue => e
      rend e.to_s
      return 500
    end
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

    soft.filename = params[:file][:filename] # not selecting a file causes error here.
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
