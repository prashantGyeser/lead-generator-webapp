# == Schema Information
#
# Table name: site_emails
#
#  id                :integer          not null, primary key
#  email             :string(255)
#  notification_sent :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#

class SiteEmail < ActiveRecord::Base

  after_create :send_hello_email

  def send_hello_email
    HelloMailer.on_email_left(self.email).deliver
  end

end
