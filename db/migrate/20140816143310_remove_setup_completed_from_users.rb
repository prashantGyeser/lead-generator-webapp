class RemoveSetupCompletedFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :setup_completed, :boolean
  end
end
