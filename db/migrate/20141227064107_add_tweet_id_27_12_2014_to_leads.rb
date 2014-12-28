class AddTweetId27122014ToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :tweet_id, :integer
  end
end
