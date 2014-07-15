# == Schema Information
#
# Table name: user_leads
#
#  id         :integer          not null, primary key
#  lead_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  viewed     :boolean
#

class UserLead < ActiveRecord::Base
  after_create :set_viewed_status

  private

  def set_viewed_status
    self.viewed = false
    self.save
  end
end
