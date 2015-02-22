class SubscriptionHelper

  def remaining_days(user)
    ((user.created_at + (user.trial_duration).days).to_date - Date.today).round
  end

  def trial_active?(user)
    if remaining_days(user) > 0
      return true
    else
      return false
    end
  end

  def is_subscribed?(user)
    if (Subscription.where(user_id: user.id).count) > 0
      true
    else
      false
    end
  end

end