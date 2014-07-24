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

  def self.add_5_new_leads_for_user(user)
    leads = Lead.leads_not_in_the_last_month.first(5)
    leads.each do |lead|
      UserLead.create(:lead_id => lead.id, :user_id => user.id)
      lead.date_last_shown = Time.now
      lead.save!
    end
  end

  private


  def set_viewed_status
    self.viewed = false
    self.save
  end
end
