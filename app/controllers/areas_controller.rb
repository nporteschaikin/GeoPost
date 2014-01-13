class AreasController < ApplicationController
  
  def show
    @area   =   current_user.areas.find params[:id]
  end
  
end