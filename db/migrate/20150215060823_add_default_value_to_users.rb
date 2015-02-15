class AddDefaultValueToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :total_streams, 1)
    change_column_default(:users, :trial_duration, 7)
  end
end
