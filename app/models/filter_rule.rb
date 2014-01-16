class FilterRule < ActiveRecord::Base
  
  belongs_to      :filter
  attr_accessible :scope, :value
  serialize       :value
  
  
  
end
