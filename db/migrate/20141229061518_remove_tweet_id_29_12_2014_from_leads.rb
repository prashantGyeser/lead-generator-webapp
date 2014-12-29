class RemoveTweetId29122014FromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :tweet_id, :integer
  end
end
