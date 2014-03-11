class AreasController < ApplicationController

  def show
    @area  = Area.find params[:id]
    @post  = Post.new unless current_user?(@area.user)
  end

end
