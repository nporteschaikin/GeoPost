class HomeController < ApplicationController

  before_filter   :signed_in,    only: :user
  before_filter   :signed_out,   only: :guest

  def guest
  end

  def user
    @post  = Post.new
  end

end
