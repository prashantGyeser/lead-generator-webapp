class AddDefaultKeywordStatusToKeywords < ActiveRecord::Migration
  def change
    change_column_default(:keywords, :archived, false)
  end
end
