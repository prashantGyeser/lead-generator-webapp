# == Schema Information
#
# Table name: email_lefts
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  city       :string(255)
#

class EmailLeft < ActiveRecord::Base

  validates_uniqueness_of :email

  after_create :send_invite

  def send_invite
    User.invite!(:email => self.email)
  end

end
