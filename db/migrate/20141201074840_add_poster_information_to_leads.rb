class AddPosterInformationToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :poster_id, :string
    add_column :leads, :poster_name, :string
    add_column :leads, :poster_screen_name, :string
    add_column :leads, :poster_follower_count, :integer
    add_column :leads, :poster_friends_count, :integer
    add_column :leads, :poster_verified, :boolean
    add_column :leads, :poster_statuses_count, :integer
    add_column :leads, :tweet_body, :string
    add_column :leads, :keyword_id, :integer
    add_column :leads, :poster_profile_image_url, :string
  end
end
