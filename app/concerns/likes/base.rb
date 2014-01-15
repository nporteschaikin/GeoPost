module Likes
  module Base
    extend ActiveSupport::Concern
    included do
    
      has_many  :likes, as: :liked
    
      scope   :where_liked_by,      lambda { |user| 
        joins(:likes)
          .where(likes: {user_id: user.id}) 
          .order("`#{Like.table_name}`.`created_at` DESC")
      }
    
      scope   :most_liked_in_last,  lambda { |time| 
        joins(:likes)
          .where(likes: {created_at: time.ago..Time.now})
          .group("`#{self.table_name}`.`id`")
          .order("COUNT(`#{Like.table_name}`.`id`) DESC")
      }
    
      def is_liked_by? user
        likes.find_by_user_id(user.id).present?
      end
    
      def like! user
        likes.create user: user
      end
    
      def unlike! user
        likes.find_by_user_id(user.id).try(:destroy)
      end
    
    end
  end
end