def warden 
  env['warden']
end

def current_user
  env['warden'].authenticate
end

def rend(view)
  @current_user = current_user
  @view = view
  erb :header
end