class AddNameToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :name, :string
  end
end
