# == Schema Information
#
# Table name: beta_signups
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beta_signup do
    ep "MyString"
    email "MyString"
  end
end
