class AddCountryIdToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :country_id, :integer
  end
end
