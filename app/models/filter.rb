class Filter < ActiveRecord::Base
  
  class << self
    
    def filter_scope name, scope
      # hmm....
    end
    
  end
  
  belongs_to  :user
  has_many    :rules, class_name: "FilterRule"
  
  filter_scope :tagged_with, "tagged(?)"
  filter_scope :posted_after, "where(?)"
  
  def posts
    Post.class_eval(scopes.join("."))
  end
  
  private
    
    def scopes
      array = []
      rules.each do |rule|
        array << self.class.send("#{rule.scope}_scope", rule.value)
      end
      array
    end
  
end
