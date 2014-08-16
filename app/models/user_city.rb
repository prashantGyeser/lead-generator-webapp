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

  after_create :send_to_processor_if_setup_completed

  def send_to_processor_if_setup_completed
    SetupCompleteSendUserToProcessor.send_user_to_processor(self.user_id)
  end

end
