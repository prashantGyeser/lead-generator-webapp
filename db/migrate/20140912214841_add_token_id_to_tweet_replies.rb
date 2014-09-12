class AddTokenIdToTweetReplies < ActiveRecord::Migration
  def change
    add_column :tweet_replies, :token_id, :integer
  end
end
