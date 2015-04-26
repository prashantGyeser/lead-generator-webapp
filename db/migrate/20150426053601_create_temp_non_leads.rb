class CreateTempNonLeads < ActiveRecord::Migration
  def change
    create_table :temp_non_leads do |t|
      t.string :poster_id
      t.string :poster_name
      t.string :poster_screen_name
      t.integer :poster_follower_count
      t.integer :poster_friends_count
      t.boolean :poster_verified
      t.integer :poster_statuses_count
      t.string :tweet_body
      t.integer :keyword_id
      t.string :poster_profile_image_url
      t.string :tweet_id

      t.timestamps
    end
  end
end
