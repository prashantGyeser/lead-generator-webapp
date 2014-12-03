class AddAdminCreatedToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :admin_created, :boolean
  end
end
