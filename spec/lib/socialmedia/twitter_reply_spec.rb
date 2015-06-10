require 'socialmedia/twitter_reply'
require 'rails_helper'

describe TwitterReply, :vcr do
  before :each do
    @twitter_credentials = {oauth_token: '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz', oauth_secret: '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7'}
    @message = "This is a test post to see how things look 2"
  end

  it "should send a reply given a valid message" do
    reply = TwitterReply.new(@message, @twitter_credentials).send_reply
    expect(reply.id).to eq 606334303920754688
  end

  it "should reply to a tweet given a valid tweet id" do
    reply = TwitterReply.new(@message, @twitter_credentials, '603936893957439488').send_reply
    expect(reply.id).not_to eq 606334303920754688
  end
end