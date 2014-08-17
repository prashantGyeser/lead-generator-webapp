class ParseAndStoreLeads

  def self.save_lead(processor_lead)

    user = User.find_by_email(processor_lead["email"])

    lead = Lead.new(screen_name: processor_lead["tweet_poster_screen_name"], tweet: processor_lead["tweet_body"], location: processor_lead["user_location"], tweet_id: processor_lead["tweet_id"], user_id: user.id)

    if lead.save
      return true
    else
      return false
    end

  end

end