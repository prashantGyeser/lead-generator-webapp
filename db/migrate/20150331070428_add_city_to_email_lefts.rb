class AddCityToEmailLefts < ActiveRecord::Migration
  def change
    add_column :email_lefts, :city, :string
  end
end
