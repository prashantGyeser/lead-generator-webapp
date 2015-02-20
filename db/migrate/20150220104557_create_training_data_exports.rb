class CreateTrainingDataExports < ActiveRecord::Migration
  def change
    create_table :training_data_exports do |t|
      t.string :tweet_id
      t.string :type
      t.string :keyword_term
      t.string :category
      t.string :tweet_body

      t.timestamps
    end
  end
end
