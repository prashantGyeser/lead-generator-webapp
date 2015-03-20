class RemoveMessageFromNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :message, :string
    add_column :notifications, :message, :text
  end
end
