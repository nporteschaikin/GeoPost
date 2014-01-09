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
  
end
