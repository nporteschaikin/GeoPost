class Like < ActiveRecord::Base
  
  attr_accessible   :user
  
  belongs_to  :liked, polymorphic: true, counter_cache: true
  belongs_to  :user
  
  validates   :user_id, uniqueness: { scope: [:liked_id, :liked_type] }, presence: true
  
end
