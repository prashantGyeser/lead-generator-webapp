class AddEmailLeftIdToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :email_left_id, :integer
  end
end
