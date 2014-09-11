# == Schema Information
#
# Table name: reports
#
#  id                   :integer          not null, primary key
#  total_tweets_for_day :integer
#  city_id              :integer
#  category_id          :integer
#  created_at           :datetime
#  updated_at           :datetime
#  date_collected       :date
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    total_tweets_for_day 1
    date_collected 1
    city_id 1
    category_id 1
  end
end
