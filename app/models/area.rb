class Area < ActiveRecord::Base
  
  class << self
    def area_associations *associations
      associations.each do |association|
        define_method association do
          "#{association}".classify.constantize.near place, radius
        end
      end
    end
  end
  
  attr_accessible   :label, :radius, :place, :user
  
  belongs_to  :user
  belongs_to  :place
  
  area_associations   :posts
  
  validates_associated        :user, :place
  validates_presence_of       :user, :place, :label
  validates_numericality_of   :radius
  
  after_save  :update_user_default_area_if_nil
  
  def description
    "within #{radius} #{radius == 1 ? "mile" : "miles"} of #{place.address}"
  end
  
  private
  
    def update_user_default_area_if_nil
      if user.default_area.nil?
        user.default_area = self
        user.save!
      end
    end
  
end
