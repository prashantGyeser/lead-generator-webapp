# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  country_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
  validates_uniqueness_of :name, :scope => :country_id
end
