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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country_subdivision do
    country_id 1
    latitude 1.5
    longitude 1.5
  end
end
