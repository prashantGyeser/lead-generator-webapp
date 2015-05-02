class AddLocationToNonLeads < ActiveRecord::Migration
  def change
    add_column :non_leads, :location, :string
  end
end
