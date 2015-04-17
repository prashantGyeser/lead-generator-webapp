# == Schema Information
#
# Table name: countries
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  alternate_name :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Country < ActiveRecord::Base
  has_many :country_subdivisions
end
