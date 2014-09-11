class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :total_tweets_for_day
      t.integer :date_collected
      t.integer :city_id
      t.integer :category_id

      t.timestamps
    end
  end
end
