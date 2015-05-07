# == Schema Information
#
# Table name: follows
#
#  id                  :integer          not null, primary key
#  twitter_screen_name :string(255)
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Follow < ActiveRecord::Base
  validates_uniqueness_of :twitter_screen_name, scope: :user_id
end
