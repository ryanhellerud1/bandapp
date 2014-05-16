 require 'bcrypt'
class User
  include Mongoid::Document
  #attr_accessor something exist during the app but not in data. same as def getter and setter. 
  
  attr_accessor :password

  field :username, type: String
  field :salt, type: String
  field :email, type: String
  field :hashed_password, type: String

  validates :username, uniqueness: true

  def authenticate(password)
    self.hashed_password == BCrypt::Engine.hash_secret(password, self.salt)
  end

  before_save :hash_word 

  private
    def hash_word
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret self.password, self.salt
      self.password = nil
    end
end