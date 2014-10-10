class SubscriptionUtils

  def check_if_subscribed?(user_id)
    subscription = Subscription.where(user_id: user_id)

    if subscription.blank?
      subscription_available = false
    else
      subscription_available = true
    end
    return subscription_available
  end

  def trial_over?(user_id)
    user = User.find(user_id)

    if user.trial_duration.blank?
      if Date.today > (user.created_at + 7)
        return true
      end
    else
      if Date.today > (user.created_at + user.trial_duration)
        return true
      end
    end

    return false

  end

  def trial_days_remaining(user_id)
    user = User.find(user_id)
    sign_up_date = user.created_at

    if user.trial_duration.blank?
      days_remaining = ((sign_up_date.to_date + 7) - Date.today).to_i
    else
      days_remaining = ((sign_up_date.to_date + user.trial_duration) - Date.today).to_i
    end

    return days_remaining

  end


end