json.users @users.each do |user|
  json.extract! user, :id, :email

  # Getting the status of the subscription for the user
  subscription_count = Subscription.where(user_id: user.id).count
  if subscription_count > 0
    json.subscribed = true
  else
    json.subscribed = false
  end

  # Checking if any lead streams are empty for this user
  no_leads = false
  lead_streams = LeadStream.where(user_id: user.id)
  lead_streams.each do |lead_stream|
    user_leads_today = UserLead.where(lead_stream_id: lead_stream.id).where("created_at >= ?", Time.zone.now.beginning_of_day).count
    if user_leads_today <= 0
      no_leads = true
    end
  end

  json.no_leads no_leads

  json.signup_date Time.parse(user.created_at.to_s).utc.to_i*1000

  if subscription_count <= 0
    json.subscribed false
    if !user.trial_duration.nil?
      days_remaining = user.trial_duration - ((Time.now - user.created_at.to_time)/1.day).to_i

      if days_remaining <= 0
        json.days_remaining 0
      else
        json.days_remaining days_remaining
      end
    else
      json.days_remaining "No trial days set!"
    end
  end


end