class CreateUnprocessedTweets < ActiveRecord::Migration
  def change
    create_table :unprocessed_tweets do |t|
      t.string :poster_id
      t.string :poster_name
      t.string :poster_screen_name
      t.integer :poster_follower_count
      t.integer :poster_friends_count
      t.boolean :poster_verified
      t.integer :poster_statuses_count
      t.string :poster_rpofile_image_url
      t.string :tweet_body

      t.timestamps
    end
  end
end
