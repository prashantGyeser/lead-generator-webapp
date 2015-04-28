class AddGeoEnabledToUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :geo_enabled, :string
  end
end
