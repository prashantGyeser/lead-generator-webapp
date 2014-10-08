require 'httparty'

class SendLeadStreams

  def send_unique_streams

    url = ENV['PROCESSOR_SERVER_URL'] + '/api/v1/lead_streams'

    @result = HTTParty.post(url,
      :body => SendLeadStreams.get_unique_streams.to_json,
      :headers => { 'Content-Type' => 'application/json' } )
  end



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