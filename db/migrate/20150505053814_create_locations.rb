class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :country_id
      t.string :name

      t.timestamps
    end
  end
end
