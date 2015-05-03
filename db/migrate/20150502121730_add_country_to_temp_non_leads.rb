class AddCountryToTempNonLeads < ActiveRecord::Migration
  def change
    add_column :temp_non_leads, :country, :string
  end
end
