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
#

class TweetReply < ActiveRecord::Base
  belongs_to :user
  validates_length_of :message, :minimum => 10, :maximum => 120, :allow_blank => false
end
