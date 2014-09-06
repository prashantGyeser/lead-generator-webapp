# == Schema Information
#
# Table name: lead_streams
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  city_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class LeadStream < ActiveRecord::Base
end
