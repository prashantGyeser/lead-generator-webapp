class AddLeadStreamIdToUserLeads < ActiveRecord::Migration
  def change
    add_column :user_leads, :lead_stream_id, :integer
  end
end
