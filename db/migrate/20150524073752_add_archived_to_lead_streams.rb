class AddArchivedToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :archived, :boolean, :default => false
  end
end
