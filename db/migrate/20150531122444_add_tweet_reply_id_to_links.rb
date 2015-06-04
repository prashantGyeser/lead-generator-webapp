class AddTweetReplyIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :tweet_reply_id, :integer
  end
end
