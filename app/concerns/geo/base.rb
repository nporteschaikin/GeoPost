require "geocoder/calculations"
require "geocoder/sql"

module Geo
  module Base
    extend ActiveSupport::Concern
    included do
    
      belongs_to  :place
    
      scope :near, lambda {|place, radius|
        within(
          Geocoder::Calculations.bounding_box(
            [place.latitude, place.longitude], 
            radius
          )
        )
      }
    
      scope :in, lambda {|places| 
        joins(:place).where(places: {id: places})
      }
      
      scope :within, lambda {|bounds|
        args = bounds + ["`#{Place.table_name}`.`latitude`", "`#{Place.table_name}`.`longitude`"]
        sql = Geocoder::Sql.within_bounding_box(*args)
        joins(:place).where(sql)
      }
    
    end
  end
end