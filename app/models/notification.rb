# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  message           :text
#  archived          :boolean          default(FALSE)
#  notification_type :string(255)
#

class Notification < ActiveRecord::Base

  validates_presence_of :notification_type, :user_id

end
