class AddProfileImageUrlToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :profile_image_url, :string
  end
end
