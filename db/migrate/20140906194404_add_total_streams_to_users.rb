class AddTotalStreamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_streams, :integer
  end
end
