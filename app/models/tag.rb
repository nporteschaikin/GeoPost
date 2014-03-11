class Tag < ActiveRecord::Base

  attr_accessible         :name, :slug
  validates_presence_of   :name, :slug

  has_many    :tag_relationships

  validates   :name, uniqueness: { case_sensitive: false }

  before_validation   :update_slug_from_title

  class << self

    def named name
      find_or_initialize_by_name name
    end

  end

  private

    def update_slug_from_title
      self.slug = name.parameterize
    end

end
