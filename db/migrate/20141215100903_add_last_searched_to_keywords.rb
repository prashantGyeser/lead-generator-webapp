class AddLastSearchedToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :last_searched, :time
  end
end
