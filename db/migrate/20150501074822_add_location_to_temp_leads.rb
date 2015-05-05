class AddLocationToTempLeads < ActiveRecord::Migration
  def change
    add_column :temp_leads, :location, :string
  end
end
