class Asset < ActiveRecord::Base
  
  attr_accessible   :attachment, :type
  has_attached_file :attachment
  
  belongs_to        :attached, polymorphic: true
  
  validates_presence_of   :type, :attached
  
  def url size = :original
    attachment.url size
  end
  
end
