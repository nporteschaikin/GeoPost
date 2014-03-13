class Comment < ActiveRecord::Base
  
  include Likes::Base
  
  belongs_to    :user
  belongs_to    :post, counter_cache: true
  
  default_scope   { order "created_at DESC" }
  
  attr_accessible   :message, :user
  
  validates_presence_of :user_id, :post_id, :message
  validates             :message, length: { maximum: 250 }
  
end
