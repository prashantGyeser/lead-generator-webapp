class AddTweetId27122014ToNonLeads < ActiveRecord::Migration
  def change
    add_column :non_leads, :tweet_id, :integer
  end
end
