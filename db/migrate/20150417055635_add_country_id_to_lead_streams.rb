class AddCountryIdToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :country_id, :integer
  end
end
