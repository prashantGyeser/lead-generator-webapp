class AddCountryToTempLeads < ActiveRecord::Migration
  def change
    add_column :temp_leads, :country, :string
  end
end
