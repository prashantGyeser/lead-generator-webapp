class AddCountryIdToTempNonLeads < ActiveRecord::Migration
  def change
    add_column :temp_non_leads, :country_id, :integer
  end
end
