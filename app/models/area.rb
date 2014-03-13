class Area < ActiveRecord::Base

  include Areas::Association

  attr_accessible   :label, :radius, :place, :user

  belongs_to  :user
  belongs_to  :place

  area_associations   :posts

  validates_presence_of       :user_id, :place_id, :label
  validates_numericality_of   :radius

  after_save    :update_user_default_area_if_nil

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

end
