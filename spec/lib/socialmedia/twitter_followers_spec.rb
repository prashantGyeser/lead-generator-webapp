require 'socialmedia/twitter_followers'
require 'rails_helper'

describe TwitterFollowers, :vcr do

  it "should return a list of all the followers for a given user" do
    user = User.create(email: 'prashant@urbanzeak.com', password: 'password@123', password_confirmation: 'password@123')
    token = Token.create(user_id: user.id, oauth_token: '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz', oauth_secret: '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7')

    followers = TwitterFollowers.new(token.oauth_token, token.oauth_secret).get_followers

    expect(followers.count).to eq 7
  end

end