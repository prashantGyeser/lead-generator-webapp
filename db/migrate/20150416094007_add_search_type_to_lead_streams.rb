class AddSearchTypeToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :search_type, :string
  end
end
