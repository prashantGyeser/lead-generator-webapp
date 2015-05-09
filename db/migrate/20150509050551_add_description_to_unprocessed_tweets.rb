class AddDescriptionToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :description, :text
  end
end
