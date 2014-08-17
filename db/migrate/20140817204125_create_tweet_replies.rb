class CreateTweetReplies < ActiveRecord::Migration
  def change
    create_table :tweet_replies do |t|
      t.integer :lead_id
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
