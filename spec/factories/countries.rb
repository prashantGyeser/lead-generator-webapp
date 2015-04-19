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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country do
    name "MyString"
    alternate_name "MyString"
  end
end
