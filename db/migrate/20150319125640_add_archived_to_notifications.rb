class AddArchivedToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :archived, :boolean, default: false
  end
end
