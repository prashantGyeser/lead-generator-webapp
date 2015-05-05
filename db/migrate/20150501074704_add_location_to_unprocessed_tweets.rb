class AddLocationToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :location, :string
  end
end
