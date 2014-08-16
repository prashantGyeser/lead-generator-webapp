class AddSetupCompletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :setup_completed, :boolean
  end
end
