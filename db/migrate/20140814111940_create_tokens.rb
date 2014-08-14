class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
  end
end
