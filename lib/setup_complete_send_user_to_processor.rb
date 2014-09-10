require 'send_to_processor'
require 'setup_status'

class SetupCompleteSendUserToProcessor

  def self.send_user_to_processor(user_id)

    user = User.find(user_id)

    if (SetupStatus.setup_complete?(user_id) && user.user_sent_to_processor != true)
      SendToProcessor.send_user(user_id)
      user.user_sent_to_processor = true
      user.save
    end

  end

end