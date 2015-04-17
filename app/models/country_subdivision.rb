# == Schema Information
#
# Table name: country_subdivisions
#
#  id         :integer          not null, primary key
#  country_id :integer
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#  radius     :integer
#

class CountrySubdivision < ActiveRecord::Base
  belongs_to :country
end
