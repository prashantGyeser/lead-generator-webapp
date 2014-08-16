class AddUserSentToProcessorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_sent_to_processor, :boolean
  end
end
