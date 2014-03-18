require "geocoder/calculations"
require "geocoder/sql"

module Geo
  module Base
    extend ActiveSupport::Concern
    included do

      belongs_to       :place
      delegate         :query, :query=, to: :place, prefix: true
      delegate         :to_geojson, :for_geojson, to: :place, prefix: false
      validates        :place, associated: true, presence: true
      attr_accessible  :place_query

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

      def place
        super || build_place
      end

    end
    module ClassMethods
      def for_geojson
        {
          type: "FeatureCollection",
          features: includes(:place).map(&:for_geojson)
        }
      end
      def to_geojson
        for_geojson
          .to_json
      end
    end
  end
end
