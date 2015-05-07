class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.string :twitter_screen_name
      t.integer :user_id

      t.timestamps
    end
  end
end
