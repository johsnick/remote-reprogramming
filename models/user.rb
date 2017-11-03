class User < Sequel::Model
  include BCrypt

  def self.authenticate(username, password)
    u = User.first(username: username)
    if u && u.password == password
      return u
    else 
      return nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end 

  def password=(password)
    @password = Password.create(password)
    self.password_hash = @password
  end
end
