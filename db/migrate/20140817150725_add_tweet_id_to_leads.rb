class AddTweetIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :tweet_id, :string
  end
end
