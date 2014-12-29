class RemoveTweetId29122014FromNonLeads < ActiveRecord::Migration
  def change
    remove_column :non_leads, :tweet_id, :integer
  end
end
