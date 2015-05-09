class AddDescriptionToTempLeads < ActiveRecord::Migration
  def change
    add_column :temp_leads, :description, :text
  end
end
