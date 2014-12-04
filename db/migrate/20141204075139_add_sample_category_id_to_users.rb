class AddSampleCategoryIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sample_category_id, :integer
  end
end
