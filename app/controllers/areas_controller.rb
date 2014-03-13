class AreasController < ApplicationController

  def show
    @area  = Area.find params[:id]
    @posts = @area.posts
  end

  def category
    @category  =  Category.find(params[:id])
  end

end
