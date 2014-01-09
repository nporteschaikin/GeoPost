class Comment < ActiveRecord::Base
  
  include Likeable
  
  belongs_to    :user
  belongs_to    :post, counter_cache: true
  
  default_scope   { order "created_at DESC" }
  
  attr_accessible   :message, :user
  
  validates_associated  :user, :post
  validates_presence_of :user, :post, :message
  validates             :message, length: { maximum: 250 }
  
end
