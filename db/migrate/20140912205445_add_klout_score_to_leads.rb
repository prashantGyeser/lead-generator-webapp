class AddKloutScoreToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :klout_score, :integer
  end
end
