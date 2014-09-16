class AddReplySentToUserLeads < ActiveRecord::Migration
  def change
    add_column :user_leads, :reply_sent, :boolean
  end
end
