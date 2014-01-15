class Post < ActiveRecord::Base
  
  include Geo::Base
  include Likes::Base
  include Tags::Base
  
  attr_accessible :message, :user, :place, :category
  
  belongs_to      :user
  belongs_to      :category
  has_many        :comments
  
  default_scope   { order "posts.created_at DESC" }
  
  scope           :listing, lambda { includes :user, :place, :comments, :likes }
  
  validates               :message, length: { maximum: 250 }
  validates_presence_of   :user_id, :place_id, :category_id

end
