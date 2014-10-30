class ShareLeads

  def share_datsift_leads
    Lead.find_each do |lead|
      if lead.lead_stream_id.blank?
        lead_streams = LeadStream.where(category_id: lead.category_id).where(city_id: lead.city_id)
        lead_streams.each do |lead_stream|
          user = User.find(lead_stream.user_id)
          if ShareLeads.lead_created_after_sign_up?(lead.created_at, user.created_at)
            user_lead = UserLead.create(lead_id: lead.id, user_id: lead_stream.user_id, lead_stream_id: lead_stream.id)
          end
        end
      end
    end
  end

  def share_todays_leads
    leads = Lead.where("created_at >= ?", Time.zone.now.beginning_of_day)
    puts "Total leads today: #{leads.count}"
    leads.each do |lead|
      if lead.lead_stream_id.blank?
        lead_streams = LeadStream.where(category_id: lead.category_id).where(city_id: lead.city_id)
        lead_streams.each do |lead_stream|
          user = User.find(lead_stream.user_id)
          if ShareLeads.lead_created_after_sign_up?(lead.created_at, user.created_at)
            user_lead = UserLead.create(lead_id: lead.id, user_id: lead_stream.user_id, lead_stream_id: lead_stream.id)
          end
        end
      end
    end
  end

  def self.lead_created_after_sign_up?(lead_date, user_signup_date)
    return lead_date >= user_signup_date
  end


end