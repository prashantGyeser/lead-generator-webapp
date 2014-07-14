class AddTimesShownToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :times_shown, :integer
    add_column :leads, :date_last_shown, :date
  end
end
