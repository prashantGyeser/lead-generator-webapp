# == Schema Information
#
# Table name: leads
#
#  id              :integer          not null, primary key
#  screen_name     :string(255)
#  tweet           :text
#  location        :string(255)
#  profile_url     :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  times_shown     :integer
#  date_last_shown :date
#

class Lead < ActiveRecord::Base

  def self.set_date_last_shown(date_to_store, lead_to_modify)
    lead = Lead.find(lead_to_modify)
    lead.date_last_shown = date_to_store
    lead.save
  end

  def self.leads_not_in_the_last_month
    return Lead.where("date_last_shown < ?", (Time.now - 1.month))
  end

end
