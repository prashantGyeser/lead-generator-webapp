class AddArchivedToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :archived, :boolean
  end
end
