class AddLastSearched20122014ToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :last_searched, :datetime
  end
end
