class NotificationHelper

  def set_generic_email(user_id)

    message = %"We could not determine your website address, we use your website to determine your industry and to generate additional keywords in case your current keywords get too few results. <a>Set your site address</a>"

    notification = Notification.new(message: message, user_id: user_id)

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