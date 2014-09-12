# == Schema Information
#
# Table name: tokens
#
#  id           :integer          not null, primary key
#  provider     :string(255)
#  uid          :string(255)
#  name         :string(255)
#  oauth_token  :string(255)
#  oauth_secret :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  screen_name  :string(255)
#

class Token < ActiveRecord::Base

  # after_create :send_to_processor_if_setup_completed
  #
  # def send_to_processor_if_setup_completed
  #   SetupCompleteSendUserToProcessor.send_user_to_processor(self.user_id)
  # end

end
