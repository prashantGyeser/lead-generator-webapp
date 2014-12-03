class CreateSampleLeads < ActiveRecord::Migration
  def change
    create_table :sample_leads do |t|
      t.integer :sample_category_id
      t.string :tweet
      t.string :screen_name

      t.timestamps
    end
  end
end
