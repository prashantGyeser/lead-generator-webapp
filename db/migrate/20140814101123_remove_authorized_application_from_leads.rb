class RemoveAuthorizedApplicationFromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :authorized_application, :boolean
  end
end
