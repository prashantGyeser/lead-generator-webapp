class AddNotLeadToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :not_lead, :boolean
  end
end
