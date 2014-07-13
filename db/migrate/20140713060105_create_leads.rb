class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :screen_name
      t.text :tweet
      t.string :location
      t.string :profile_url

      t.timestamps
    end
  end
end
