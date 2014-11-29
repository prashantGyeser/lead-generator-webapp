class AddKeywordIdToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :keyword_id, :integer
  end
end
