class Post < ActiveRecord::Base
  
  include Geo
  include Likeable
  
  attr_accessible :message, :user, :place
  belongs_to      :user
  default_scope   { order "created_at DESC" }
  
  has_many        :comments
  
  validates   :message, length: { maximum: 250 }
  validates_presence_of   :user, :place
  validates_associated    :user, :place

end
