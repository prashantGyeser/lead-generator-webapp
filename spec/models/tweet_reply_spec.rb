# == Schema Information
#
# Table name: tweet_replies
#
#  id         :integer          not null, primary key
#  lead_id    :integer
#  message    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  token_id   :integer
#  tweet_id   :string(255)
#

require 'rails_helper'

RSpec.describe TweetReply, :vcr, :type => :model do

  before(:each) do
    @lead = Lead.create(tweet_id: '603936893957439488', keyword_id: 1)
    @token = Token.create(oauth_token: '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz', oauth_secret: '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7')
  end

  it "should shorten and replace all the links in a message" do
    tweet_reply = TweetReply.create(message: "hello this is a test with a link http://google.com and http://yahoo.com", lead_id: @lead.id, token_id: @token.id)
    expect(TweetReply.last.message).to include "http://urbanzeak.com"
    expect(Link.count).to eq 2
  end
end
