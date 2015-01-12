class AddLastResultCountToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :last_result_count, :integer
    add_column :keywords, :last_duplicate_count, :integer
  end
end
