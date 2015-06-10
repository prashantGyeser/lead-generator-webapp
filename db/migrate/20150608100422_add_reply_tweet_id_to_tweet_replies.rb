class AddReplyTweetIdToTweetReplies < ActiveRecord::Migration
  def change
    add_column :tweet_replies, :reply_tweet_id, :string
  end
end
