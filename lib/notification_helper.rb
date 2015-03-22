class NotificationHelper

  def set_generic_email(user_id)

    notification = Notification.new(notification_type: "no_website", user_id: user_id)

    if notification.save
      return true
    else
      return notification.errors
    end

  end

  def set_nonperforming_keyword(user)

  end

  def archive_generic_email(message)

  end

  def archive_nonperforming_keyword(message)

  end






end