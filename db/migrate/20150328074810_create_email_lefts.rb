class CreateEmailLefts < ActiveRecord::Migration
  def change
    create_table :email_lefts do |t|
      t.string :email

      t.timestamps
    end
  end
end
