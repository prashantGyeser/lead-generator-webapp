class SetDefaultForFounderEmailInUsers < ActiveRecord::Migration
  def change
    change_column :users, :founder_welcome_sent, :boolean, :default => false
    change_column :users, :trial_over_notification_sent, :boolean, :default => false
  end
end
