# == Schema Information
#
# Table name: subscription_plans
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  price        :integer
#  lead_streams :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription_plan do
    name "MyString"
    price 1
    lead_streams 1
  end
end
