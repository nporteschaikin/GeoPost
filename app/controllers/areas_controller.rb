class AreasController < ApplicationController

  def show
    @area  = Area.find params[:id]
    respond_to do |f|
      f.js { render layout: false }
    end
  end

  def category
    @category  =  Category.find(params[:id])
  end

end
