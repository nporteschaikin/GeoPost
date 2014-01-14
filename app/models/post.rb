class Post < ActiveRecord::Base
  
  include Geo::Place
  include Likeable
  
  attr_accessible :message, :user, :place
  belongs_to      :user
  
  default_scope   { order "posts.created_at DESC" }
  
  scope           :listing, lambda { includes :user, :place, :comments, :likes }
  
  has_many        :comments
  
  validates   :message, length: { maximum: 250 }
  validates_presence_of   :user, :place
  validates_associated    :user, :place

end
