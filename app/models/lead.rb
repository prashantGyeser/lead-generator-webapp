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
  after_create :set_last_show_date
  def set_last_show_date
    self.date_last_shown = Time.now - 3.month
    self.save
  end
end
