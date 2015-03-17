class RemoveEpFromBetaSignups < ActiveRecord::Migration
  def change
    remove_column :beta_signups, :ep, :string
  end
end
