class AddFriendsCountToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :friends_count, :integer
    add_column :leads, :followers_count, :integer
  end
end
