class AddScreenNameToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :screen_name, :string
  end
end
