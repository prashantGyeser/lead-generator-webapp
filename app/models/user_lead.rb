# == Schema Information
#
# Table name: user_leads
#
#  id             :integer          not null, primary key
#  lead_id        :integer
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  viewed         :boolean
#  lead_stream_id :integer
#  reply_sent     :boolean
#

class UserLead < ActiveRecord::Base

  validates_uniqueness_of :lead_id, scope: :user_id
  #validates :lead_id, :uniqueness => {:scope => :user_id}

  after_create :set_viewed_status

  private


  def set_viewed_status
    self.viewed = false
    self.save
  end
end
