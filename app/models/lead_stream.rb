# == Schema Information
#
# Table name: lead_streams
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  city_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  city_name   :string(255)
#  latitude    :float
#  longitude   :float
#  name        :string(255)
#

class LeadStream < ActiveRecord::Base
  has_many :keywords
  accepts_nested_attributes_for :keywords, allow_destroy: true, :reject_if => proc { |keyword| keyword[:term].blank? }, limit: 3

  before_save :set_lat_lon

  def set_lat_lon
    coordinates = Geocoder.coordinates(self.city_name)
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end

end

