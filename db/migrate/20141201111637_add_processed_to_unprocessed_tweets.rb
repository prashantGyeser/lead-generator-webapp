class AddProcessedToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :processed, :boolean
  end
end
