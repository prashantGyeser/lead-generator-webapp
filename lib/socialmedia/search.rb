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
    puts "it is getting to the geocode search"
    begin
      client.search( term, result_type: "recent", geocode: "#{lat_lon_hash[:latitude]},#{lat_lon_hash[:longitude]},#{radius}km" ).collect
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Search Error",
          :error_message => "Twitter Search Error: #{e.message}",
          :parameters    => {user_email: user.email}
      )
    end


  end

end