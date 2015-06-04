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

RSpec.describe TweetReply, :type => :model do

  it "should shorten and replace all the links in a message" do
    tweet_reply = TweetReply.create(message: "hello this is a test with a link http://google.com and http://yahoo.com", lead_id: 1)
    tweet_reply.shorten_links
    expect(TweetReply.last.message).to include "http://urbanzeak.com"
    expect(Link.count).to eq 2
  end
end
