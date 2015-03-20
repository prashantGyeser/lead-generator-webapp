# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  message    :text
#  archived   :boolean          default(FALSE)
#

class Notification < ActiveRecord::Base

  validates_presence_of :message, :user_id

end
