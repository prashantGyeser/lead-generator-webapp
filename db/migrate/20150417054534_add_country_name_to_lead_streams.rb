class AddCountryNameToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :country_name, :string
  end
end
