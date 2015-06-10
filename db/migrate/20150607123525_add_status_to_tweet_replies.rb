class AddStatusToTweetReplies < ActiveRecord::Migration
  def change
    add_column :tweet_replies, :retweet_count, :integer
    add_column :tweet_replies, :favorites_count, :integer
  end
end
