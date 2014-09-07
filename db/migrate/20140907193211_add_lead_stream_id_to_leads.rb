class AddLeadStreamIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :lead_stream_id, :integer
  end
end
