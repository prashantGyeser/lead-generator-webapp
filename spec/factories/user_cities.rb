# == Schema Information
#
# Table name: user_cities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_city do
    user_id 1
    city_id 1
  end
end
