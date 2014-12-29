class AddTweetId29122014ToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :tweet_id, :string
  end
end
