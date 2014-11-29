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
#  city_name   :string(255)
#

class LeadStream < ActiveRecord::Base
  has_many :keywords
  accepts_nested_attributes_for :keywords
end

