class CreateSiteEmails < ActiveRecord::Migration
  def change
    create_table :site_emails do |t|
      t.string :email
      t.boolean :notification_sent, :default => false

      t.timestamps
    end
  end
end
