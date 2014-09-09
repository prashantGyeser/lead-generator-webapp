class AddCityIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :city_id, :integer
    add_column :leads, :category_id, :integer
  end
end
