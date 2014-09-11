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

end