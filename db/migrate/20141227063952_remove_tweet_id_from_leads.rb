class RemoveTweetIdFromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :tweet_id, :string
  end
end
