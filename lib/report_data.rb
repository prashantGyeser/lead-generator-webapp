class ReportData

  def self.last_7_days_reports_for_user(user_id)

    @lead_streams = LeadStream.where(user_id: user_id)

    sum_of_tweets_array = []

    @lead_streams.each do |lead_stream|
      i = 0
      while i < 7
        reports = Report.where(category_id: lead_stream.category_id).where(city_id: lead_stream.city_id).where(date_collected: (i+1).day.ago)

        if reports.count > 0
          total_tweets_for_day = reports.pluck(:total_tweets_for_day).sum

          current_number_of_tweets_for_day = sum_of_tweets_array[i]
          if current_number_of_tweets_for_day.nil?
            sum_of_tweets_array[i] = total_tweets_for_day
          else
            sum_of_tweets_array[i] = current_number_of_tweets_for_day + total_tweets_for_day
          end
        else
          sum_of_tweets_array[i] = 0

        end
        i = i + 1
      end

    end

    return sum_of_tweets_array

  end

  def self.lead_count_for_last_7_days(user_id)
    sum_of_leads_array = []
    i = 0

    while i<7
      total_user_leads = UserLead.where(user_id: user_id).where(created_at: (i+1).day.ago).count

      if total_user_leads.nil?
        sum_of_leads_array[i] = 0
      else
        sum_of_leads_array[i] = total_user_leads
      end
      i = i + 1
    end

    return sum_of_leads_array

  end

  def self.total_leads_for_user_today(user_id)
    return  UserLead.where(user_id: 1).where("created_at >= ?", Time.zone.now.beginning_of_day).count
  end

  def self.total_leads_for_user(user_id)
    return UserLead.where(user_id: user_id).count
  end

  def self.total_tweet_replies_user_sent(user_id)
    return TweetReply.where(user_id: user_id).count
  end

  def self.total_replies_for_user_today(user_id)
    return TweetReply.where(user_id: user_id).where("created_at >= ?", Time.zone.now.beginning_of_day).count
  end

  def self.reach_today(user_id)
    total_reach = 0
    user_leads = UserLead.where(user_id: user_id).where("created_at >= ?", Time.zone.now.beginning_of_day)

    user_leads.each do |user_lead|
      lead = Lead.find(user_lead.lead_id)
      if !lead.friends_count.nil?
        total_reach = total_reach + lead.friends_count
      end
    end

    return total_reach
  end

  def self.total_reach(user_id)
    total_reach = 0
    user_leads = UserLead.where(user_id: user_id)

    user_leads.each do |user_lead|
      lead = Lead.find(user_lead.lead_id)

      if !lead.friends_count.nil?
        total_reach = total_reach + lead.friends_count
      end

    end

    return total_reach
  end

end