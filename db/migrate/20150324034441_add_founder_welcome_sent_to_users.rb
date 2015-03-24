class AddFounderWelcomeSentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :founder_welcome_sent, :boolean
    add_column :users, :trial_over_notification_sent, :boolean
  end
end
