class User < ActiveRecord::Base
  
  attr_accessible   :first_name, :last_name, :email, :password, 
                    :password_confirmation, :date_of_birth
  
  has_secure_password
  
  has_many    :posts
  has_many    :areas
  
  validates   :username, presence: true, uniqueness: {case_sensitive: false} # FIXME: More elaborate validation required
  
  validates   :email, email: true
  validates   :password, confirmation: true, length: { minimum: 6 }, on: :create
  validates   :password_confirmation, presence: true, on: :create
  
  before_save   { |user| user.email = email.downcase }
  before_save   :update_remember_token
  
  private
  
    def update_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
        
end