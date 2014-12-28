class AddTweetIdToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :tweet_id, :integer
  end
end
