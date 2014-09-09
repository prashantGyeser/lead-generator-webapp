class ParseAndStoreLeads

  def self.save_lead(processor_lead)

    puts "the unprocessed lead is: #{processor_lead.inspect}"

    begin
      lead_attributes = {}
      lead_attributes[:screen_name] = processor_lead["tweet_poster_screen_name"]
      lead_attributes[:tweet] = processor_lead["tweet_body"]
      lead_attributes[:location] = processor_lead["user_location"]
      lead_attributes[:tweet_id] = processor_lead["tweet_id"]
      if processor_lead["email"].blank?
        city = City.find_by_name(processor_lead["city"])
        category = Category.find_by_name(processor_lead["category"])
        lead_attributes[:city_id] = city.id
        lead_attributes[:category_id] = category.id
        lead_attributes[:processor_datasift_subscription_id] = processor_lead["processor_datasift_subscription_id"].to_i
      else
        user = User.find_by_email(processor_lead["email"])
        lead_attributes[:user_id] = user.id
      end

      lead = Lead.new(lead_attributes)

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