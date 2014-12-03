class CreateSampleCategories < ActiveRecord::Migration
  def change
    create_table :sample_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
