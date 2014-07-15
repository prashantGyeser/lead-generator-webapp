class AddViewedToUserLeads < ActiveRecord::Migration
  def change
    add_column :user_leads, :viewed, :boolean
  end
end
