class AddTweetIdToTweetReplies < ActiveRecord::Migration
  def change
    add_column :tweet_replies, :tweet_id, :string
  end
end
