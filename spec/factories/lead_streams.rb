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
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lead_stream do
    user_id 1
    category_id 1
    city_id 1
  end
end
