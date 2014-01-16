module Tags
  module Base
    extend ActiveSupport::Concern
    included do
      
			has_many  :tag_relationships, as: :tagged, dependent: :destroy
			has_many  :tags, through: :tag_relationships
      
      scope :tagged, lambda { |array_of_tags| 
        joins(:tags)
          .where(tags: {
            name: array_of_tags
          }
        ) 
      }
      
      def tag! array_of_tag_names
        Array(array_of_tag_names).each do |name|
          self.tags << Tag.named(name) unless self.tags.exists?(name: name)
        end
      end
      
      def tags= array_of_tag_names
        tag_relationships.destroy_all
        tag! array_of_tag_names
      end
      
    end
  end
end
