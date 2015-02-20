class RemoveTypeFromTrainingDataExports < ActiveRecord::Migration
  def change
    remove_column :training_data_exports, :type, :string
  end
end
