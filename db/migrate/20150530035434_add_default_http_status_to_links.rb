class AddDefaultHttpStatusToLinks < ActiveRecord::Migration
  def change
    change_column :links, :http_status, :integer, :default => 301
    add_index :links, :in_url
  end
end
