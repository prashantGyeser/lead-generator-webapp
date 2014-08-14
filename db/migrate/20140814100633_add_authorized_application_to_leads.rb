class AddAuthorizedApplicationToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :authorized_application, :boolean
  end
end
