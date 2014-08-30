class ParseAndStoreLeads

  def self.save_lead(processor_lead)

    begin

      user = User.find_by_email(processor_lead["email"])

      lead = Lead.new(screen_name: processor_lead["tweet_poster_screen_name"], tweet: processor_lead["tweet_body"], location: processor_lead["user_location"], tweet_id: processor_lead["tweet_id"], user_id: user.id)

      if lead.save
        return true
      else
        return false
      end
    rescue => e
      Honeybadger.notify(
          :error_class   => "Import from processor error",
          :error_message => "Import Error: #{e.message}. The user email is: #{processor_lead["email"]}",
          :parameters    => processor_lead
      )
    end


  end

end