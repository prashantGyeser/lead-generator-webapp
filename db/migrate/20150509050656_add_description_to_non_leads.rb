class AddDescriptionToNonLeads < ActiveRecord::Migration
  def change
    add_column :non_leads, :description, :text
  end
end
