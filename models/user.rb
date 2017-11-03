require 'bcrypt'

class User < Sequel::Model
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end 

  def password=(password)
    @password = Password.create(password)
    self.password_hash = @password
  end
end
