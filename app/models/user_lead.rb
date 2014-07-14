# == Schema Information
#
# Table name: user_leads
#
#  id         :integer          not null, primary key
#  lead_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserLead < ActiveRecord::Base
end
