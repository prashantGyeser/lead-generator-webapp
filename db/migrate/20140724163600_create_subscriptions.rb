class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :account_code
      t.string :plan_code
      t.integer :user_id

      t.timestamps
    end
  end
end
