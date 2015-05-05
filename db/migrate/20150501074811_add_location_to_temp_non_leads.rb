class AddLocationToTempNonLeads < ActiveRecord::Migration
  def change
    add_column :temp_non_leads, :location, :string
  end
end
