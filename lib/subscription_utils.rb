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

    if Date.today > (user.created_at + 7)
      return true
    end

    return false

  end

  def trial_days_remaining(user_id)
    user = User.find(user_id)
  end


end