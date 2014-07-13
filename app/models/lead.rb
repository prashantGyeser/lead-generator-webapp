# == Schema Information
#
# Table name: leads
#
#  id          :integer          not null, primary key
#  screen_name :string(255)
#  tweet       :text
#  location    :string(255)
#  profile_url :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Lead < ActiveRecord::Base
end
