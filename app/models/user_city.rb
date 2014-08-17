# == Schema Information
#
# Table name: user_cities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserCity < ActiveRecord::Base
  belongs_to :user
end
