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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    country_id 1
    name "MyString"
  end
end
