class AddUserImageUrlToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :user_image_url, :string
  end
end
