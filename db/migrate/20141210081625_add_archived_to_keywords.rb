class AddArchivedToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :archived, :boolean
  end
end
