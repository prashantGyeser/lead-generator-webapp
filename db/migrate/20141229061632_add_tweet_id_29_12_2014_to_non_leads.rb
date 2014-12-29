class AddTweetId29122014ToNonLeads < ActiveRecord::Migration
  def change
    add_column :non_leads, :tweet_id, :string
  end
end
