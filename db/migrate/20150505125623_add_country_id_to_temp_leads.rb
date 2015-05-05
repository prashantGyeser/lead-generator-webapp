class AddCountryIdToTempLeads < ActiveRecord::Migration
  def change
    add_column :temp_leads, :country_id, :integer
  end
end
