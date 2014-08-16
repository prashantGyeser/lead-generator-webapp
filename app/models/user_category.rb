# == Schema Information
#
# Table name: user_categories
#
#  id          :integer          not null, primary key
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UserCategory < ActiveRecord::Base
  belongs_to :user
end
