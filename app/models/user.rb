class User < ActiveRecord::Base
  
  include Assets::Associations
  
  attr_accessible   :username, :first_name, :last_name, :email, 
                    :password, :password_confirmation, :date_of_birth
  
  has_secure_password
  
  has_many    :posts
  has_many    :areas
  has_many    :likes
  
  asset       :avatar
  
  belongs_to  :default_area, class_name: "Area"
  validate    :default_area_belongs_to_user
  
  validates   :username, presence: true, uniqueness: { case_sensitive: false } # FIXME: More elaborate validation required
  
  validates   :email, email: true, uniqueness: { case_sensitive: false }
  validates   :password, confirmation: true, length: { minimum: 6 }, on: :create
  validates   :password_confirmation, presence: true, on: :create
  
  before_save   { |user| user.email = email.downcase }
  before_save   :update_remember_token
  
  class << self
    
    def find_by_email_or_username email_or_username
      case email_or_username
      when /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        find_by_email email_or_username
      else
        find_by_username email_or_username
      end
    end
    
  end
  
  private
  
    def update_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
    def default_area_belongs_to_user
      unless default_area.nil?
        errors.add(:default_area, "cannot be added to this user") unless default_area.user_id == id
      end
    end
        
end