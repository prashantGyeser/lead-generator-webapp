# == Schema Information
#
# Table name: lead_streams
#
#  id                             :integer          not null, primary key
#  user_id                        :integer
#  category_id                    :integer
#  city_id                        :integer
#  created_at                     :datetime
#  updated_at                     :datetime
#  city_name                      :string(255)
#  latitude                       :float
#  longitude                      :float
#  name                           :string(255)
#  email_left_id                  :integer
#  search_type                    :string(255)
#  country_name                   :string(255)
#  country_id                     :integer
#  time_left_for_processing_hours :integer
#  time_left_for_processing_mins  :integer
#

class LeadStream < ActiveRecord::Base
  has_many :keywords, dependent: :destroy
  belongs_to :user
  belongs_to :email_left
  accepts_nested_attributes_for :keywords, allow_destroy: true, :reject_if => proc { |keyword| keyword[:term].blank? }
  validate :lead_streams_count_within_limit, on: :create

  #before_save :set_lat_lon



  def lead_streams_count_within_limit
    if !self.user.nil?
      if self.user.lead_streams(:reload).count >= self.user.total_streams # self is optional
        errors.add(:base, 'Exceeded stream limit')
      end
    end
  end


  def set_lat_lon
    coordinates = Geocoder.coordinates(self.city_name)
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end

end

