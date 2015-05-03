class AddCountryToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :country, :string
  end
end
