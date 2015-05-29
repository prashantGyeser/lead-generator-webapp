require 'socialmedia/twitter_followers'
require 'rails_helper'

describe TwitterFollowers, :vcr do

  it "should return a list of all the followers for a given user" do
    followers = TwitterFollowers.new('2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz', '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7').get_followers

    expect(followers.count).to eq 7
  end

end