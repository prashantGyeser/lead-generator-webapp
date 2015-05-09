class AddDescriptionToTempNonLeads < ActiveRecord::Migration
  def change
    add_column :temp_non_leads, :description, :text
  end
end
