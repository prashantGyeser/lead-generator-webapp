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

  after_create :send_to_processor_if_setup_completed

  def send_to_processor_if_setup_completed
    SetupCompleteSendUserToProcessor.send_user_to_processor(self.user_id)
  end

end
