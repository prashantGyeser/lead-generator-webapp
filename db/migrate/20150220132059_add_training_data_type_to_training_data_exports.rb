class AddTrainingDataTypeToTrainingDataExports < ActiveRecord::Migration
  def change
    add_column :training_data_exports, :training_data_type, :string
  end
end
