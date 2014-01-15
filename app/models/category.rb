class Category < ActiveRecord::Base
  
  validates_presence_of   :name
  validates               :slug, slug: true, uniqueness: { case_sensitive: false }
  
  attr_accessible   :name, :slug, :parent
  
  has_many  :posts
  
end
