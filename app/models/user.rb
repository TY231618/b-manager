require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, format: :email_address, required: true

  property :password_digest, Text

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
