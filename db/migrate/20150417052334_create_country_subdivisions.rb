class CreateCountrySubdivisions < ActiveRecord::Migration
  def change
    create_table :country_subdivisions do |t|
      t.integer :country_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
