class AddNotWorkingToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :not_working, :boolean
  end
end
