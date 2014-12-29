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
#

require 'rails_helper'

RSpec.describe UnprocessedTweet, :type => :model do

  it "should store the tweet in the leads table" do
    unprocessed_tweet = UnprocessedTweet.create(tweet_body: "This is a test")
    results = unprocessed_tweet.move_tweet("true")

    expect(Lead.count).to eq 1

  end

  it "should store the tweet in the non leads table" do
    unprocessed_tweet = UnprocessedTweet.create(tweet_body: "This is a test")
    results = unprocessed_tweet.move_tweet("false")

    expect(NonLead.count).to eq 1

  end

end
