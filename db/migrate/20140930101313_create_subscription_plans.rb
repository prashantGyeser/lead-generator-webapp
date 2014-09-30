class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.string :name
      t.integer :price
      t.integer :lead_streams

      t.timestamps
    end
  end
end
