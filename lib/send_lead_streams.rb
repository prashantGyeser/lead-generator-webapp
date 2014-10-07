class SendLeadStreams

  def self.get_unique_streams

    unique_streams = []

    LeadStream.find_each do |lead_stream|

      city = City.find(lead_stream.city_id)
      category = Category.find(lead_stream.category_id)

      if unique_streams.blank?
        unique_streams << {city: city.name, category: category.name}
      else
        unique_streams.each do |unique_stream|
          if unique_stream[:city] == city.name && unique_stream[:category] == category.name
          else
            unique_streams << {city: city.name, category: category.name}
          end
        end
      end
    end

    return unique_streams

  end

end