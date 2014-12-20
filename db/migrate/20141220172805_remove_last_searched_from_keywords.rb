class RemoveLastSearchedFromKeywords < ActiveRecord::Migration
  def change
    remove_column :keywords, :last_searched, :time
  end
end
