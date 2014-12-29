class RemoveTweetIdFromUnprocessedTweets < ActiveRecord::Migration
  def change
    remove_column :unprocessed_tweets, :tweet_id, :integer
  end
end
