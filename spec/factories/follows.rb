# == Schema Information
#
# Table name: follows
#
#  id                  :integer          not null, primary key
#  twitter_screen_name :string(255)
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :follow do
    twitter_screen_name "MyString"
    user_id 1
  end
end
