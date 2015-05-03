class AddCountryToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :country, :string
  end
end
