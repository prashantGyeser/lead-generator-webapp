class Search

  def twitter(term, client)

    begin
      client.search( term ).collect
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Search Error",
          :error_message => "Twitter Search Error: #{e.message}",
          :parameters    => {user_email: user.email}
      )
    end

  end


  def twitter_geocode(term, lat_lon_hash, radius, client)

    begin
      client.search( term, geocode: "#{lat_lon_hash[:latitude]},#{lat_lon_hash[:longitude]},#{radius}km" ).collect
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Search Error",
          :error_message => "Twitter Search Error: #{e.message}",
          :parameters    => {user_email: user.email}
      )
    end


  end

end