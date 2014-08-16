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
    status = SetupStatus.setup_complete?(self.user_id)

    user = User.find(self.user_id)

    if (status == true) && (user != true)
      SendUserToExternalSystem.send_user
    end
  end

end
