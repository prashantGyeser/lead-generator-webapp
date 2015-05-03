# == Schema Information
#
# Table name: unprocessed_tweets
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
#  created_at               :datetime
#  updated_at               :datetime
#  keyword_id               :integer
#  poster_profile_image_url :string(255)
#  processed                :boolean
#  tweet_id                 :string(255)
#  geo_enabled              :string(255)
#  location                 :string(255)
#  country                  :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unprocessed_tweet do
    poster_id "MyString"
    poster_name "MyString"
    poster_screen_name "MyString"
    poster_follower_count 1
    poster_friends_count 1
    poster_verified false
    poster_statuses_count 1
    poster_rpofile_image_url "MyString"
    tweet_body "MyString"
  end
end
