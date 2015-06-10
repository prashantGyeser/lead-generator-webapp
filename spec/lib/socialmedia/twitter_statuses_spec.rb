require 'socialmedia/twitter_statuses'
require 'rails_helper'

describe TwitterStatuses, :vcr do
  before(:each) do
    @twitter_credentials = {
        oauth_token: '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz',
        oauth_secret: '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7'
    }
    @valid_tweet_id = '598231234792194048'
  end

  it "should return the details for a given tweet id" do
    tweet_status = TwitterStatuses.new(@twitter_credentials).tweet_status(@valid_tweet_id)
    expect(tweet_status[:favorites_count]).to be > 0
  end
  
end