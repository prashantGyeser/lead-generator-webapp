# == Schema Information
#
# Table name: non_leads
#
#  id                       :integer          not null, primary key
#  poster_id                :string(255)
#  poster_name              :string(255)
#  poster_screen_name       :string(255)
#  poster_follower_count    :integer
#  poster_friends_count     :integer
#  poster_verified          :boolean
#  poster_statuses_count    :integer
#  tweet_body               :string(255)
#  keyword_id               :integer
#  poster_profile_image_url :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  tweet_id                 :string(255)
#  location                 :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :non_lead do
    poster_id "MyString"
    poster_name "MyString"
    poster_screen_name "MyString"
    poster_follower_count 1
    poster_friends_count 1
    poster_verified false
    poster_statuses_count 1
    tweet_body "MyString"
    keyword_id 1
    poster_profile_image_url "MyString"
  end
end
