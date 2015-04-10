class AddActiveBetaFeatureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_beta_feature, :string
  end
end
