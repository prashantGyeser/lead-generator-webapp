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
  validates_uniqueness_of :email

  after_create :send_invite

  def send_invite
    User.invite!(:email => self.email)
  end

end
