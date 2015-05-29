require 'socialmedia/twitter_user'
require 'rails_helper'

describe TwitterUser, :vcr do

  it "should return a users detail given a valid twitter user id" do
    twitter_user_ids = [2264730672, 2952281370, 1202460848, 929250926,2700716244,2201066062,2299376786]

    twitter_user = TwitterUser.new('2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz', '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7').lookup(twitter_user_ids)

    expect(twitter_user.count).to eq 7
    expect(twitter_user.last).to be_a Twitter::User
  end

end