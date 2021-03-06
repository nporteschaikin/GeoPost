class Post < ActiveRecord::Base

  include Geo::Base
  include Likes::Base
  include Tags::Base
  include Filter::Base

  attr_accessible :title, :body, :user, :place, :category

  belongs_to      :user
  belongs_to      :category
  has_many        :comments

  default_scope   { order "posts.created_at DESC" }

  scope   :listing,   -> { includes :user, :place, :comments, :likes }
  scope   :after,     lambda { |datetime| where "created_at > ?", datetime }
  scope   :before,    lambda { |datetime| where "created_at < ?", datetime }
  scope   :between,   lambda { |start, finish| where "created_at BETWEEN ? AND ?", start, finish }
  scope   :in,        lambda { |category| joins(:category).where(category: {id: category.id}) }

  validates  :title, length: { maximum: 250 }
  validates  :body, length: { minimum: 15, maximum: 2500 }
  validates  :user, presence: true
  validates  :category, presence: true

end
