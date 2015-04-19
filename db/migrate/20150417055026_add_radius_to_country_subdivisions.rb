class AddRadiusToCountrySubdivisions < ActiveRecord::Migration
  def change
    add_column :country_subdivisions, :radius, :integer
  end
end
