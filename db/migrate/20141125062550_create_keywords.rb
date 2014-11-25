class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :term
      t.integer :lead_stream_id

      t.timestamps
    end
  end
end
