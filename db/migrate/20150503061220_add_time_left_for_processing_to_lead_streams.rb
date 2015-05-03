class AddTimeLeftForProcessingToLeadStreams < ActiveRecord::Migration
  def change
    add_column :lead_streams, :time_left_for_processing_hours, :integer
    add_column :lead_streams, :time_left_for_processing_mins, :integer
  end
end
