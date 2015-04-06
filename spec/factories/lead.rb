FactoryGirl.define do
  factory :lead do
    tweet_body Faker::Lorem.sentence
    poster_screen_name Faker::Internet.user_name
    poster_profile_image_url Faker::Avatar.image
    tweet_id Faker::Lorem.word
  end
end
