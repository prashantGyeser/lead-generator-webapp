class AddGenderToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :gender, :string
  end
end
