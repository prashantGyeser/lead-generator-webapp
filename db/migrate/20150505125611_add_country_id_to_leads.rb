class AddCountryIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :country_id, :integer
  end
end
