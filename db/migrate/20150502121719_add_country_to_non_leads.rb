class AddCountryToNonLeads < ActiveRecord::Migration
  def change
    add_column :non_leads, :country, :string
  end
end
