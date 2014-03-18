require "open-uri"

class Area < ActiveRecord::Base

  include Areas::Association
  include Assets::Base

  attr_accessible   :label, :radius, :place, :user

  asset :map

  belongs_to  :user
  belongs_to  :place

  area_associations   :posts

  validates_presence_of       :user_id, :place_id, :label
  validates_numericality_of   :radius

  after_save    :update_user_default_area_if_nil
  after_save    :update_map_from_google

  delegate      :address, :short_address, to: :place

  def bounds
    Geocoder::Calculations.bounding_box(
      [place.latitude, place.longitude],
      radius
    )
  end

  private

    def update_user_default_area_if_nil
      if user.default_area.nil?
        user.default_area = self
        user.save!
      end
    end

    def update_map_from_google
      create_map(
        attachment: open(google_maps_url)
      )
    end

    def google_maps_url
      "http://maps.googleapis.com/maps/api/staticmap?#{google_maps_parameters.to_query}"
    end
    
    def google_maps_parameters
      {
        center: "#{place.latitude},#{place.longitude}",
        zoom: (14 - Math.log(radius) / Math.log(2)).round, # http://jeffjason.com/2011/12/google-maps-radius-to-zoom/
        size: "640x640",
        sensor: false 
      }
    end

end
