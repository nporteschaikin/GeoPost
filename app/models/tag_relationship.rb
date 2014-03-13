class TagRelationship < ActiveRecord::Base
  
  belongs_to      :tagged, polymorphic: true
  belongs_to      :tag
  
  validates_presence_of   :tagged_id, :tagged_type, :tag_id
  validates_uniqueness_of :tag_id, scope: [:tagged_id, :tagged_type]
  
end
