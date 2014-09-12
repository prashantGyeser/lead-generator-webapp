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
  validates_uniqueness_of :user_id, :scope => [:category_id, :city_id], :message => "cannot have two streams with the same city and category"
end

