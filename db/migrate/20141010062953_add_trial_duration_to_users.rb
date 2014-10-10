class AddTrialDurationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trial_duration, :integer
  end
end
