class AddCountryIdToNonLeads < ActiveRecord::Migration
  def change
    add_column :non_leads, :country_id, :integer
  end
end
