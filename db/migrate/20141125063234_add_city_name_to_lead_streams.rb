class AddCityNameToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :city_name, :string
  end
end
