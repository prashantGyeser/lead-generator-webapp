class AddOnTrialOrSubscribedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :on_trial_or_subscribed, :boolean, :default => true
  end
end
