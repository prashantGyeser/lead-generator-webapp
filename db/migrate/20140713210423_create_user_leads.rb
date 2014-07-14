class CreateUserLeads < ActiveRecord::Migration
  def change
    create_table :user_leads do |t|
      t.integer :lead_id
      t.integer :user_id

      t.timestamps
    end
  end
end
