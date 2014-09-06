class CreateLeadStreams < ActiveRecord::Migration
  def change
    create_table :lead_streams do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :city_id

      t.timestamps
    end
  end
end
