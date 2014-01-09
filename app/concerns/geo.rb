require "geocoder/calculations"
require "geocoder/sql"

module Geo
  extend ActiveSupport::Concern
  included do
    
    belongs_to  :place
    
    scope   :near, lambda { |place, radius|
      bounds  = Geocoder::Calculations.bounding_box [place.latitude, place.longitude], radius
      args    = bounds + ["`#{Place.table_name}`.`latitude`", "`#{Place.table_name}`.`longitude`"]
      sql     = Geocoder::Sql.within_bounding_box *args
      joins(:place).where(sql)
    }
    
  end
end