class AddDefaultNewUserToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :new_user, true)
  end
end
