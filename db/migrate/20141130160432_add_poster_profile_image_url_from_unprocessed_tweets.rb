class AddPosterProfileImageUrlFromUnprocessedTweets < ActiveRecord::Migration
  def change
    add_column :unprocessed_tweets, :poster_profile_image_url, :string
  end
end
