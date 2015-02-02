class AddLastRunToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :last_run, :datetime
  end
end
