class RemoveDateCollectedFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :date_collected, :integer
  end
end
