class AddLatLonToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :latitude, :float
    add_column :lead_streams, :longitude, :float
  end
end
