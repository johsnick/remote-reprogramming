def warden 
  env['warden']
end

def current_user
  env['warden'].authenticate
end