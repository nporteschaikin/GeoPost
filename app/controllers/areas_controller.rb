class AreasController < ApplicationController

  def show
    @area  = Area.find params[:id]
    respond_to do |f|
      f.js { render layout: false }
      f.html
    end
  end

  def posts
    @area  = Area.find params[:id]
    respond_to do |f|
      f.json { render json: @area.posts.to_geojson }
    end
  end

end
