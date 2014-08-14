class AddAuthorizedApplicationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authorized_application, :boolean
  end
end
