class RemovePosterRpofileImageUrlFromUnprocessedTweets < ActiveRecord::Migration
  def change
    remove_column :unprocessed_tweets, :poster_rpofile_image_url, :string
  end
end
