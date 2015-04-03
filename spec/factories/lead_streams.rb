# == Schema Information
#
# Table name: lead_streams
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  category_id   :integer
#  city_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  city_name     :string(255)
#  latitude      :float
#  longitude     :float
#  name          :string(255)
#  email_left_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lead_stream do
    city_name "New York"
  end
end
