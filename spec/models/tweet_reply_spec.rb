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
  pending "add some examples to (or delete) #{__FILE__}"
end
