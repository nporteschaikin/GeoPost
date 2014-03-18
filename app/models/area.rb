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
      map   = build_map(attachment: open(google_maps_url))
      map.save
    end

    def google_maps_url
      "http://maps.googleapis.com/maps/api/staticmap?center=#{place.latitude},#{place.longitude}&zoom=#{google_maps_zoom_level}&size=640x640&sensor=false"
    end

    def google_maps_zoom_level
      # source: http://jeffjason.com/2011/12/google-maps-radius-to-zoom/
      # this is not perfect by any stretch...
      (14 - Math.log(radius) / Math.log(2)).round
    end

end
